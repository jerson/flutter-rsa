import 'dart:async';
import 'dart:ffi';
import 'dart:io' show Platform;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:fast_rsa/bridge/ffi.dart';
import 'package:fast_rsa/bridge/isolate.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:path/path.dart' as Path;

class Binding {
  static final String _callFuncName = 'RSABridgeCall';
  static final String _libraryName = 'librsa_bridge';
  static final Binding _instance = Binding._internal();

  late final DynamicLibrary _library;

  late final BridgeCallDart _bridgeCall;

  factory Binding() {
    return _instance;
  }

  Binding._internal() {
    _library = openLib();
    _bridgeCall =
        _library.lookupFunction<BridgeCallC, BridgeCallDart>(_callFuncName);
  }

  @pragma('vm:entry-point')
  static void _callBridge(IsolateArguments args) {
    var result = _instance.call(args.name, args.payload);
    args.port.send(result);
  }

  Future<Uint8List> callAsync(String name, Uint8List payload) async {
    final port = ReceivePort();
    final completer = Completer<Uint8List>();

    try {
      final isolate = await Isolate.spawn(
        _callBridge,
        IsolateArguments(name, payload, port.sendPort),
        errorsAreFatal: false,
        debugName: '${_libraryName}_isolate',
        onError: port.sendPort,
      );

      port.listen((message) {
        try {
          if (message is Uint8List) {
            completer.complete(message);
          } else if (message is List && message.isNotEmpty) {
            completer.completeError(message.first ?? "internal error");
          } else {
            completer.completeError("spawn error");
          }
        } finally {
          port.close();
          isolate.kill(priority: Isolate.beforeNextEvent);
        }
      });

      return completer.future;
    } catch (e) {
      port.close();
      throw RSAException("Failed to start isolate: $e");
    }
  }

  Uint8List call(String name, Uint8List payload) {
    if (_bridgeCall == null) {
      throw RSAException(
          "FFI function ${_callFuncName} is not initialized. Check library loading.");
    }

    final namePointer = name.toNativeUtf8();
    final payloadPointer = malloc.allocate<Uint8>(payload.length);
    payloadPointer.asTypedList(payload.length).setAll(0, payload);

    final result =
        _bridgeCall(namePointer, payloadPointer.cast<Void>(), payload.length);
    if (result.address == 0) {
      throw RSAException(
          "FFI function ${_callFuncName} returned null pointer. Check rsa-mobile implementation.");
    }

    malloc.free(namePointer);
    malloc.free(payloadPointer);

    handleError(result.ref.errorMessage, result);
    final output = result.ref.toUint8List();
    freeResult(result);

    return output;
  }

  void handleError(String? error, Pointer<BytesReturn> result) {
    if (error != null && error.isNotEmpty) {
      freeResult(result);
      throw RSAException(error);
    }
  }

  void freeResult(Pointer<BytesReturn> result) {
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

  DynamicLibrary openLib() {
    var isFlutterTest = Platform.environment.containsKey('FLUTTER_TEST');

    if (Platform.isMacOS || Platform.isIOS) {
      if (isFlutterTest) {
        final appDirectory =
            _findAppDirectory(Directory('build/macos/Build/Products/Debug'));
        var ffiFile = Path.join(
            appDirectory.path, "Contents", "Frameworks", "$_libraryName.dylib");
        validateTestFFIFile(ffiFile);
        return DynamicLibrary.open(ffiFile);
      }
      if (Platform.isMacOS) {
        return DynamicLibrary.open("$_libraryName.dylib");
      }
      if (Platform.isIOS) {
        return DynamicLibrary.process();
      }
    }

    if (Platform.isAndroid || Platform.isLinux) {
      if (isFlutterTest) {
        var arch =
            Platform.resolvedExecutable.contains("linux-x64") ? "x64" : "arm64";

        var ffiFile = 'build/linux/$arch/debug/bundle/lib/$_libraryName.so';
        validateTestFFIFile(ffiFile);
        return DynamicLibrary.open(ffiFile);
      }

      if (Platform.isLinux) {
        try {
          return DynamicLibrary.open("$_libraryName.so");
        } catch (e) {
          print(e);
          var binary = File("/proc/self/cmdline").readAsStringSync();
          var suggestedFile =
              Path.join(Path.dirname(binary), "lib", "$_libraryName.so");
          return DynamicLibrary.open(suggestedFile);
        }
      }

      if (Platform.isAndroid) {
        try {
          return DynamicLibrary.open("$_libraryName.so");
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
          return DynamicLibrary.open(loadPath);
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
        return DynamicLibrary.open(ffiFile);
      }
      return DynamicLibrary.open("$_libraryName.dll");
    }

    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }
}
