@JS()
library rsa;

import 'package:js/js.dart';

@JS()
external RSADecryptOAEP(
  String message,
  String label,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptPKCS1v15(
  String message,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptOAEP(
  String message,
  String label,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptPKCS1v15(
  String message,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSASignPSS(
  String message,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSASignPKCS1v15(
  String message,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, String result) callback,
);

@JS()
external RSAVerifyPSS(
  String signature,
  String message,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, bool result) callback,
);

@JS()
external RSAVerifyPKCS1v15(
  String signature,
  String message,
  String hashName,
  String pkcs12,
  String passphrase,
  Function(String error, bool result) callback,
);

@JS()
external RSAHash(
  String message,
  String hash,
  Function(String error, String result) callback,
);

@JS()
external RSABase64(
  String message,
  Function(String error, String result) callback,
);

@JS()
external RSAGenerate(
  int bits,
  Function(String error, KeyPairObject result) callback,
);

@JS()
class KeyPairObject {
  external String get publicKey;
  external String get privateKey;
}
