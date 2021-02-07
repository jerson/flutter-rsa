import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:fast_rsa/bridge/ffi.dart';
import 'package:fast_rsa/bridge/isolate.dart';

class Binding {
  static final String _callFuncName = 'RSABridgeCall';
  static final String _libraryName = 'librsa_bridge';
  static final Binding _singleton = Binding._internal();

  ffi.DynamicLibrary _library;

  factory Binding() {
    return _singleton;
  }

  Binding._internal() {
    _library = openLib();
  }

  static callBridge(IsolateArguments args) async {
    var result = await Binding().call(args.name, args.payload);
    args.port.send(result);
  }

  Future<Uint8List> callAsync(String name, Uint8List payload) async {
    final port = ReceivePort();
    final args = IsolateArguments(name, payload, port.sendPort);

    Isolate.spawn<IsolateArguments>(
      callBridge,
      args,
      onError: port.sendPort,
      onExit: port.sendPort,
    );

    Completer<Uint8List> completer = new Completer();

    StreamSubscription subscription;
    subscription = port.listen((message) async {
      await subscription?.cancel();
      completer.complete(message);
    });
    return completer.future;
  }

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
    final voidStar = pointer.cast<ffi.Void>();
    final nameRef = toUtf8(name);

    final result =
        callable(nameRef, voidStar, payload.length).cast<FFIBytesReturn>().ref;

    freeHere(nameRef);
    freeHere(voidStar);

    handleError(result.error, result.addressOf);

    final output = result.message.cast<ffi.Uint8>().asTypedList(result.size);
    freeHere(result.addressOf);
    return output;
  }

  void handleError(ffi.Pointer<Utf8> error, ffi.Pointer pointer) {
    if (error.address != ffi.nullptr.address) {
      var message = fromUtf8(error);
      freeHere(pointer);
      throw message;
    }
  }

  ffi.Pointer<Utf8> toUtf8(String text) {
    return text == null ? Utf8.toUtf8("") : Utf8.toUtf8(text);
  }

  String fromUtf8(ffi.Pointer<Utf8> text) {
    return text == null ? "" : Utf8.fromUtf8(text);
  }

  void freeHere(ffi.Pointer pointer) {
    // FIXME by now i realize that free on windows is not working as expected
    if (!Platform.isWindows) {
      malloc.free(pointer);
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

  ffi.DynamicLibrary openLib() {
    if (Platform.isMacOS) {
      return ffi.DynamicLibrary.process();
    }
    if (Platform.isWindows) {
      var baseDir = Directory(Platform.resolvedExecutable).parent.path;
      return ffi.DynamicLibrary.open("$baseDir\\$_libraryName.dll");
    }
    if (Platform.isIOS) {
      return ffi.DynamicLibrary.process();
    }
    if (Platform.isLinux) {
      var baseDir = Directory(Platform.resolvedExecutable).parent.path;
      return ffi.DynamicLibrary.open("$baseDir/lib/$_libraryName.so");
    }
    return ffi.DynamicLibrary.open("$_libraryName.so");
  }
}
