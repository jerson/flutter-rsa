@JS()
library go;

import 'package:fast_rsa/web/js/promise.dart';
import 'package:js/js.dart';

@JS()
class Go {
  external factory Go();
  external Promise<dynamic> run(dynamic instance);
  external String get importObject;
}

@JS('console.log')
external dynamic consoleLog(dynamic data);
