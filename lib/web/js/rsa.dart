@JS()
library rsa;

import 'package:js/js.dart';

@JS()
external RSAConvertJWKToPrivateKey(
  String data,
  String keyId,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertJWKToPublicKey(
  String data,
  String keyId,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertKeyPairToPKCS12(
  String privateKey,
  String certificate,
  String password,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPKCS12ToKeyPair(
  String pkcs12,
  String password,
  Function(String error, PKCS12KeyPairObject result) callback,
);

@JS()
external RSAConvertPrivateKeyToPKCS8(
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPrivateKeyToPKCS1(
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPrivateKeyToJWK(
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPrivateKeyToPublicKey(
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPublicKeyToPKIX(
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPublicKeyToPKCS1(
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSAConvertPublicKeyToJWK(
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptPrivateKey(
  String privateKeyEncrypted,
  String password,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptPrivateKey(
  String privateKey,
  String password,
  String cipherName,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptOAEP(
  String message,
  String label,
  String hashName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptOAEPBytes(
  String message,
  String label,
  String hashName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptPKCS1v15(
  String message,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSADecryptPKCS1v15Bytes(
  String message,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptOAEP(
  String message,
  String label,
  String hashName,
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptOAEPBytes(
  String message,
  String label,
  String hashName,
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptPKCS1v15(
  String message,
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSAEncryptPKCS1v15Bytes(
  String message,
  String publicKey,
  Function(String error, String result) callback,
);

@JS()
external RSASignPSS(
  String message,
  String hashName,
  String saltLengthName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSASignPSSBytes(
  String message,
  String hashName,
  String saltLengthName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSASignPKCS1v15(
  String message,
  String hashName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSASignPKCS1v15Bytes(
  String message,
  String hashName,
  String privateKey,
  Function(String error, String result) callback,
);

@JS()
external RSAVerifyPSS(
  String signature,
  String message,
  String hashName,
  String saltLengthName,
  String publicKey,
  Function(String error, bool result) callback,
);

@JS()
external RSAVerifyPSSBytes(
  String signature,
  String message,
  String hashName,
  String saltLengthName,
  String publicKey,
  Function(String error, bool result) callback,
);

@JS()
external RSAVerifyPKCS1v15(
  String signature,
  String message,
  String hashName,
  String publicKey,
  Function(String error, bool result) callback,
);

@JS()
external RSAVerifyPKCS1v15Bytes(
  String signature,
  String message,
  String hashName,
  String publicKey,
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
@anonymous
class KeyPairObject {
  external String get privateKey;
  external String get publicKey;
}

@JS()
@anonymous
class PKCS12KeyPairObject {
  external String get privateKey;
  external String get publicKey;
  external String get certificate;
}
