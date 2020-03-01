@JS()
library wasm;

import 'package:js/js.dart';

@JS('WebAssembly')
class WebAssembly {
  external static dynamic instantiateStreaming(
    dynamic source,
    dynamic importObject,
  );
  external static dynamic instantiate(
    dynamic bufferSource,
    dynamic importObject,
  );
}
