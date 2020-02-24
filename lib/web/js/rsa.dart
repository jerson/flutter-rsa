@JS()
library rsa;

import 'package:js/js.dart';

@JS()
external RSAGenerate(
  int bits,
  Function(String error, dynamic result) callback,
);

@JS()
external RSAHash(
  String message,
  String hash,
  Function(String error, String result) callback,
);
