@JS()
library js_go;

import 'package:fast_rsa/web/js/js_promise.dart';
import 'package:js/js.dart';

@JS()
class Go {
  external factory Go();
  external Promise<dynamic> run(dynamic instance);
  external String get importObject;
}

@JS('console.log')
external dynamic consoleLog(dynamic data);
