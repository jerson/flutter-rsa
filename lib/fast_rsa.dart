import 'dart:async';
import 'dart:convert';

import 'package:fast_rsa/fast_rsa_bridge.dart';
import 'package:fast_rsa/mixin/fast_rsa_response_handlers.dart';
import 'package:fast_rsa/model/bridge_model_generated.dart' as model;
import 'package:flutter/services.dart';

class RSAException implements Exception {
  String cause;

  RSAException(this.cause);

  @override
  String toString() {
    return 'RSAException: $cause';
  }
}

enum Hash { MD5, SHA1, SHA224, SHA256, SHA384, SHA512 }

enum PEMCipher { DES, D3DES, AES128, AES192, AES256 }

enum SaltLength { AUTO, EQUALS_HASH }

class KeyPair {
  String publicKey;
  String privateKey;

  KeyPair(this.publicKey, this.privateKey);
}

class PKCS12KeyPair {
  String publicKey;
  String privateKey;
  String certificate;

  PKCS12KeyPair(this.publicKey, this.privateKey, this.certificate);
}

class RSA with RSAResponseHandlers {
  static Future<String> convertJWKToPrivateKey(
      dynamic data, String keyId) async {
    var requestBuilder = model.ConvertJwtrequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return RSABridge.call("convertJWKToPrivateKey", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> convertJWKToPublicKey(
      dynamic data, String keyId) async {
    var requestBuilder = model.ConvertJwtrequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return RSABridge.call("convertJWKToPublicKey", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) async {
    var requestBuilder = model.ConvertKeyPairRequestObjectBuilder(
      certificate: certificate,
      password: password,
      privateKey: privateKey,
    );

    return RSABridge.call("convertKeyPairToPKCS12", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<PKCS12KeyPair> convertPKCS12ToKeyPair(
      String pkcs12, String password) async {
    var requestBuilder = model.ConvertPkcs12RequestObjectBuilder(
      password: password,
      pkcs12: pkcs12,
    );

    return RSABridge.call("convertPKCS12ToKeyPair", requestBuilder.toBytes())
        .then(RSAResponseHandlers.pkcs12KeyPairResponse);
  }

  static Future<String> convertPrivateKeyToPKCS8(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSABridge.call("convertPrivateKeyToPKCS8", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> convertPrivateKeyToPKCS1(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSABridge.call("convertPrivateKeyToPKCS1", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<dynamic> convertPrivateKeyToJWK(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSABridge.call("convertPrivateKeyToJWK", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse)
        .then(jsonDecode);
  }

  static Future<String> convertPrivateKeyToPublicKey(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSABridge.call(
            "convertPrivateKeyToPublicKey", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> convertPublicKeyToPKIX(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return RSABridge.call("convertPublicKeyToPKIX", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> convertPublicKeyToPKCS1(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return RSABridge.call("convertPublicKeyToPKCS1", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<dynamic> convertPublicKeyToJWK(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return RSABridge.call("convertPublicKeyToJWK", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse)
        .then(jsonDecode);
  }

  static Future<String> decryptPrivateKey(
      String privateKeyEncrypted, String password) async {
    var requestBuilder = model.DecryptPrivateKeyRequestObjectBuilder(
      privateKeyEncrypted: privateKeyEncrypted,
      password: password,
    );

    return RSABridge.call("decryptPrivateKey", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> encryptPrivateKey(
      String privateKey, String password, PEMCipher cipher) async {
    var requestBuilder = model.EncryptPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
      password: password,
      cipher: model.Pemcipher.values[cipher.index],
    );

    return RSABridge.call("encryptPrivateKey", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> decryptOAEP(
      String ciphertext, String label, Hash hash, String privateKey) async {
    var requestBuilder = model.DecryptOaeprequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("decryptOAEP", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> decryptOAEPBytes(
      Uint8List ciphertext, String label, Hash hash, String privateKey) async {
    var requestBuilder = model.DecryptOaepbytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("decryptOAEPBytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<String> decryptPKCS1v15(
      String ciphertext, String privateKey) async {
    var requestBuilder = model.DecryptPkcs1v15RequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return RSABridge.call("decryptPKCS1v15", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> decryptPKCS1v15Bytes(
      Uint8List ciphertext, String privateKey) async {
    var requestBuilder = model.DecryptPkcs1v15BytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return RSABridge.call("decryptPKCS1v15Bytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<String> encryptOAEP(
      String message, String label, Hash hash, String publicKey) async {
    var requestBuilder = model.EncryptOaeprequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("encryptOAEP", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> encryptOAEPBytes(
      Uint8List message, String label, Hash hash, String publicKey) async {
    var requestBuilder = model.EncryptOaepbytesRequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("encryptOAEPBytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<String> encryptPKCS1v15(
      String message, String publicKey) async {
    var requestBuilder = model.EncryptPkcs1v15RequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return RSABridge.call("encryptPKCS1v15", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> encryptPKCS1v15Bytes(
      Uint8List message, String publicKey) async {
    var requestBuilder = model.EncryptPkcs1v15BytesRequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return RSABridge.call("encryptPKCS1v15Bytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<String> signPSS(String message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var requestBuilder = model.SignPssrequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("signPSS", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> signPSSBytes(Uint8List message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var requestBuilder = model.SignPssbytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("signPSSBytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<String> signPKCS1v15(
      String message, Hash hash, String privateKey) async {
    var requestBuilder = model.SignPkcs1v15RequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("signPKCS1v15", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<Uint8List> signPKCS1v15Bytes(
      Uint8List message, Hash hash, String privateKey) async {
    var requestBuilder = model.SignPkcs1v15BytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("signPKCS1v15Bytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.bytesResponse);
  }

  static Future<bool> verifyPSS(String signature, String message, Hash hash,
      SaltLength saltLength, String publicKey) async {
    var requestBuilder = model.VerifyPssrequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("verifyPSS", requestBuilder.toBytes())
        .then(RSAResponseHandlers.boolResponse);
  }

  static Future<bool> verifyPSSBytes(Uint8List signature, Uint8List message,
      Hash hash, SaltLength saltLength, String publicKey) async {
    var requestBuilder = model.VerifyPssbytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("verifyPSSBytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.boolResponse);
  }

  static Future<bool> verifyPKCS1v15(
      String signature, String message, Hash hash, String publicKey) async {
    var requestBuilder = model.VerifyPkcs1v15RequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("verifyPKCS1v15", requestBuilder.toBytes())
        .then(RSAResponseHandlers.boolResponse);
  }

  static Future<bool> verifyPKCS1v15Bytes(Uint8List signature,
      Uint8List message, Hash hash, String publicKey) async {
    var requestBuilder = model.VerifyPkcs1v15BytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("verifyPKCS1v15Bytes", requestBuilder.toBytes())
        .then(RSAResponseHandlers.boolResponse);
  }

  static Future<String> hash(String message, Hash hash) async {
    var requestBuilder = model.HashRequestObjectBuilder(
      message: message,
      hash: model.Hash.values[hash.index],
    );

    return RSABridge.call("hash", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<String> base64(String message) async {
    var requestBuilder = model.Base64RequestObjectBuilder(
      message: message,
    );

    return RSABridge.call("base64", requestBuilder.toBytes())
        .then(RSAResponseHandlers.stringResponse);
  }

  static Future<KeyPair> generate(int bits) async {
    var requestBuilder = model.GenerateRequestObjectBuilder(
      nBits: bits,
    );

    return RSABridge.call("generate", requestBuilder.toBytes())
        .then(RSAResponseHandlers.keyPairResponse);
  }
}
