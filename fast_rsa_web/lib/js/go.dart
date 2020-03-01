@JS()
library go;

import 'package:js/js.dart';

@JS('Go')
class Go {
  external dynamic run(dynamic instance);
  external String get importObject;
}
