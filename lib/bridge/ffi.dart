import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

typedef BridgeCallC = Pointer<BytesReturn> Function(
  Pointer<Utf8> name,
  Pointer<Void> payload,
  Int32 payloadSize,
);

typedef BridgeCallDart = Pointer<BytesReturn> Function(
  Pointer<Utf8> name,
  Pointer<Void> payload,
  int payloadSize,
);

final class BytesReturn extends Struct {
  external Pointer<Void> message;
  @Int32()
  external int size;
  external Pointer<Utf8> error;

  Uint8List toUint8List() {
    if (message == nullptr || size <= 0) {
      return Uint8List(0);
    }
    return message.cast<Uint8>().asTypedList(size);
  }

  String? get errorMessage {
    return error == nullptr ? null : error.toDartString();
  }
}
