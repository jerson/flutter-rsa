@JS()
library js_rsa_bridge;

import 'package:js/js.dart';

@JS()
external rsaBridgeCall(
  String name,
  String payload,
  Function(String error, String result) callback,
);
