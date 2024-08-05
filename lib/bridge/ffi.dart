import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

typedef call_func = ffi.Pointer<FFIBytesReturn> Function(
  ffi.Pointer<Utf8>,
  ffi.Pointer<ffi.Void>,
  ffi.Int32,
);
typedef Call = ffi.Pointer<FFIBytesReturn> Function(
  ffi.Pointer<Utf8>,
  ffi.Pointer<ffi.Void>,
  int,
);

final class FFIBytesReturn extends ffi.Struct {
  external ffi.Pointer<ffi.Void> message;

  @ffi.Int32()
  external int size;

  external ffi.Pointer<Utf8> error;
}
