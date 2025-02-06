import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:fast_rsa/fast_rsa.dart';
import 'package:ffi/ffi.dart';
import 'package:fast_rsa/bridge/ffi.dart';
import 'package:fast_rsa/bridge/isolate.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as Path;

class Binding {
  static final String _callFuncName = 'RSABridgeCall';
  static final String _libraryName = 'librsa_bridge';
  static final Binding _singleton = Binding._internal();

  late ffi.DynamicLibrary _library;

  @pragma('vm:entry-point')
  factory Binding() {
    return _singleton;
  }

  Binding._internal() {
    _library = openLib();
  }

  @pragma('vm:entry-point')
  static void callBridge(IsolateArguments args) async {
    var result = await Binding().call(args.name, args.payload);
    args.port.send(result);
  }

  Future<Uint8List> callAsync(String name, Uint8List payload) async {
    final port = ReceivePort('${_libraryName}_port');
    final args = IsolateArguments(name, payload, port.sendPort);
    final completer = new Completer<Uint8List>();

    final isolate = await Isolate.spawn(
      callBridge,
      args,
      errorsAreFatal: false,
      debugName: '${_libraryName}_isolate',
      onError: port.sendPort,
    );

    port.listen(
      (message) async {
        if (message is Uint8List) {
          completer.complete(message);
        } else if (message is List) {
          completer.completeError(message.firstOrNull ?? "internal error");
        } else {
          completer.completeError(message ?? "spawn error");
        }
        port.close();
      },
      onDone: () {
        isolate.kill(priority: Isolate.beforeNextEvent);
      },
    );

    return completer.future;
  }

  @pragma('vm:entry-point')
  Future<Uint8List> call(String name, Uint8List payload) async {
    final callable = _library
        .lookup<ffi.NativeFunction<call_func>>(_callFuncName)
        .asFunction<Call>();

    final pointer = malloc<ffi.Uint8>(payload.length);

    // https://github.com/dart-lang/ffi/issues/27
    // https://github.com/objectbox/objectbox-dart/issues/69
    for (var i = 0; i < payload.length; i++) {
      pointer[i] = payload[i];
    }
    final payloadPointer = pointer.cast<ffi.Void>();
    final namePointer = toUtf8(name);

    final result = callable(namePointer, payloadPointer, payload.length);

    malloc.free(namePointer);
    malloc.free(pointer);

    handleError(result.ref.error, result);

    final output =
        result.ref.message.cast<ffi.Uint8>().asTypedList(result.ref.size);
    freeResult(result);
    return output;
  }

  void handleError(
      ffi.Pointer<Utf8> error, ffi.Pointer<FFIBytesReturn> result) {
    if (error.address != ffi.nullptr.address) {
      var message = fromUtf8(error);
      freeResult(result);
      throw new RSAException(message);
    }
  }

  ffi.Pointer<Utf8> toUtf8(String? text) {
    return text == null ? "".toNativeUtf8() : text.toNativeUtf8();
  }

  String fromUtf8(ffi.Pointer<Utf8>? text) {
    return text == null ? "" : text.toDartString();
  }

  void freeResult(ffi.Pointer<FFIBytesReturn> result) {
    if (!Platform.isWindows) {
      malloc.free(result);
    }
  }

  bool isSupported() {
    return Platform.isWindows ||
        Platform.isLinux ||
        Platform.isAndroid ||
        Platform.isMacOS ||
        Platform.isFuchsia ||
        Platform.isIOS;
  }

  void validateTestFFIFile(String path) {
    if (!File(path).existsSync()) {
      debugPrint('dynamic library not found: $path');
      throw Exception(
          '''In order to be able to run unit tests, you need to run the project first: "flutter run -d ${Platform.operatingSystem}"''');
    }
  }

  Directory _findAppDirectory(Directory directory) {
    try {
      return directory
          .listSync(recursive: false, followLinks: false)
          .whereType<Directory>()
          .firstWhere((dir) => dir.path.endsWith('.app'));
    } catch (e) {
      return directory;
    }
  }

  ffi.DynamicLibrary openLib() {
    var isFlutterTest = Platform.environment.containsKey('FLUTTER_TEST');

    if (Platform.isMacOS || Platform.isIOS) {
      if (isFlutterTest) {
        final appDirectory =
            _findAppDirectory(Directory('build/macos/Build/Products/Debug'));
        var ffiFile = Path.join(
            appDirectory.path, "Contents", "Frameworks", "$_libraryName.dylib");
        validateTestFFIFile(ffiFile);
        return ffi.DynamicLibrary.open(ffiFile);
      }
      if (Platform.isMacOS) {
        return ffi.DynamicLibrary.open("$_libraryName.dylib");
      }
      if (Platform.isIOS) {
        return ffi.DynamicLibrary.process();
      }
    }

    if (Platform.isAndroid || Platform.isLinux) {
      if (isFlutterTest) {
        var arch =
            Platform.resolvedExecutable.contains("linux-x64") ? "x64" : "arm64";

        var ffiFile = 'build/linux/$arch/debug/bundle/lib/$_libraryName.so';
        validateTestFFIFile(ffiFile);
        return ffi.DynamicLibrary.open(ffiFile);
      }

      if (Platform.isLinux) {
        try {
          return ffi.DynamicLibrary.open("$_libraryName.so");
        } catch (e) {
          print(e);
          var binary = File("/proc/self/cmdline").readAsStringSync();
          var suggestedFile =
              Path.join(Path.dirname(binary), "lib", "$_libraryName.so");
          return ffi.DynamicLibrary.open(suggestedFile);
        }
      }

      if (Platform.isAndroid) {
        try {
          return ffi.DynamicLibrary.open("$_libraryName.so");
        } catch (e) {
          print("fallback to open DynamicLibrary on older devices");
          //fallback for devices that cannot load dynamic libraries by name: load the library with an absolute path
          //read the app id
          var appid = File("/proc/self/cmdline").readAsStringSync();
          // the file /proc/self/cmdline returns a string with many trailing \0 characters, which makes the string pretty useless for dart, many
          // operations will not work correctly. remove these trailing zero bytes.
          appid = String.fromCharCodes(
              appid.codeUnits.where((element) => element != 0));
          final loadPath = "/data/data/$appid/lib/$_libraryName.so";
          return ffi.DynamicLibrary.open(loadPath);
        }
      }
    }

    if (Platform.isWindows) {
      if (isFlutterTest) {
        var arch =
            Platform.resolvedExecutable.contains("x64") ? "x64" : "arm64";

        var ffiFile = Path.canonicalize(Path.join(
            r'build\windows', arch, r'runner\Debug', '$_libraryName.dll'));
        validateTestFFIFile(ffiFile);
        return ffi.DynamicLibrary.open(ffiFile);
      }
      return ffi.DynamicLibrary.open("$_libraryName.dll");
    }

    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }
}
