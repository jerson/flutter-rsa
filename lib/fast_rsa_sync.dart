import 'dart:convert';

import 'package:fast_rsa/fast_rsa.dart';
import 'package:fast_rsa/fast_rsa_bridge.dart';
import 'package:fast_rsa/mixin/fast_rsa_response_handlers.dart';
import 'package:fast_rsa/model/bridge_model_generated.dart' as model;
import 'package:flutter/services.dart';

extension RSASync on RSA {
  static String convertJWKToPrivateKey(dynamic data, String keyId) {
    var requestBuilder = model.ConvertJwtrequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("convertJWKToPrivateKey", requestBuilder.toBytes()));
  }

  static String convertJWKToPublicKey(dynamic data, String keyId) {
    var requestBuilder = model.ConvertJwtrequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("convertJWKToPublicKey", requestBuilder.toBytes()));
  }

  static String convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) {
    var requestBuilder = model.ConvertKeyPairRequestObjectBuilder(
      certificate: certificate,
      password: password,
      privateKey: privateKey,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("convertKeyPairToPKCS12", requestBuilder.toBytes()));
  }

  static PKCS12KeyPair convertPKCS12ToKeyPair(String pkcs12, String password) {
    var requestBuilder = model.ConvertPkcs12RequestObjectBuilder(
      password: password,
      pkcs12: pkcs12,
    );

    return RSAResponseHandlers.pkcs12KeyPairResponse(
        RSABridge.callSync("convertPKCS12ToKeyPair", requestBuilder.toBytes()));
  }

  static String convertPrivateKeyToPKCS8(String privateKey) {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSAResponseHandlers.stringResponse(RSABridge.callSync(
        "convertPrivateKeyToPKCS8", requestBuilder.toBytes()));
  }

  static String convertPrivateKeyToPKCS1(String privateKey) {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSAResponseHandlers.stringResponse(RSABridge.callSync(
        "convertPrivateKeyToPKCS1", requestBuilder.toBytes()));
  }

  static dynamic convertPrivateKeyToJWK(String privateKey) {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return jsonDecode(RSAResponseHandlers.stringResponse(RSABridge.callSync(
        "convertPrivateKeyToJWK", requestBuilder.toBytes())));
  }

  static String convertPrivateKeyToPublicKey(String privateKey) {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return RSAResponseHandlers.stringResponse(RSABridge.callSync(
        "convertPrivateKeyToPublicKey", requestBuilder.toBytes()));
  }

  static String convertPublicKeyToPKIX(String publicKey) {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("convertPublicKeyToPKIX", requestBuilder.toBytes()));
  }

  static String convertPublicKeyToPKCS1(String publicKey) {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return RSAResponseHandlers.stringResponse(RSABridge.callSync(
        "convertPublicKeyToPKCS1", requestBuilder.toBytes()));
  }

  static dynamic convertPublicKeyToJWK(String publicKey) {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return jsonDecode(RSAResponseHandlers.stringResponse(
        RSABridge.callSync("convertPublicKeyToJWK", requestBuilder.toBytes())));
  }

  static String decryptPrivateKey(String privateKeyEncrypted, String password) {
    var requestBuilder = model.DecryptPrivateKeyRequestObjectBuilder(
      privateKeyEncrypted: privateKeyEncrypted,
      password: password,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("decryptPrivateKey", requestBuilder.toBytes()));
  }

  static String encryptPrivateKey(
      String privateKey, String password, PEMCipher cipher) {
    var requestBuilder = model.EncryptPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
      password: password,
      cipher: model.Pemcipher.values[cipher.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("encryptPrivateKey", requestBuilder.toBytes()));
  }

  static String decryptOAEP(
      String ciphertext, String label, Hash hash, String privateKey) {
    var requestBuilder = model.DecryptOaeprequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("decryptOAEP", requestBuilder.toBytes()));
  }

  static Uint8List decryptOAEPBytes(
      Uint8List ciphertext, String label, Hash hash, String privateKey) {
    var requestBuilder = model.DecryptOaepbytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("decryptOAEPBytes", requestBuilder.toBytes()));
  }

  static String decryptPKCS1v15(String ciphertext, String privateKey) {
    var requestBuilder = model.DecryptPkcs1v15RequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("decryptPKCS1v15", requestBuilder.toBytes()));
  }

  static Uint8List decryptPKCS1v15Bytes(
      Uint8List ciphertext, String privateKey) {
    var requestBuilder = model.DecryptPkcs1v15BytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("decryptPKCS1v15Bytes", requestBuilder.toBytes()));
  }

  static String encryptOAEP(
      String message, String label, Hash hash, String publicKey) {
    var requestBuilder = model.EncryptOaeprequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("encryptOAEP", requestBuilder.toBytes()));
  }

  static Uint8List encryptOAEPBytes(
      Uint8List message, String label, Hash hash, String publicKey) {
    var requestBuilder = model.EncryptOaepbytesRequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("encryptOAEPBytes", requestBuilder.toBytes()));
  }

  static String encryptPKCS1v15(String message, String publicKey) {
    var requestBuilder = model.EncryptPkcs1v15RequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("encryptPKCS1v15", requestBuilder.toBytes()));
  }

  static Uint8List encryptPKCS1v15Bytes(Uint8List message, String publicKey) {
    var requestBuilder = model.EncryptPkcs1v15BytesRequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("encryptPKCS1v15Bytes", requestBuilder.toBytes()));
  }

  static String signPSS(
      String message, Hash hash, SaltLength saltLength, String privateKey) {
    var requestBuilder = model.SignPssrequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("signPSS", requestBuilder.toBytes()));
  }

  static Uint8List signPSSBytes(
      Uint8List message, Hash hash, SaltLength saltLength, String privateKey) {
    var requestBuilder = model.SignPssbytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("signPSSBytes", requestBuilder.toBytes()));
  }

  static String signPKCS1v15(String message, Hash hash, String privateKey) {
    var requestBuilder = model.SignPkcs1v15RequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("signPKCS1v15", requestBuilder.toBytes()));
  }

  static Uint8List signPKCS1v15Bytes(
      Uint8List message, Hash hash, String privateKey) {
    var requestBuilder = model.SignPkcs1v15BytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.bytesResponse(
        RSABridge.callSync("signPKCS1v15Bytes", requestBuilder.toBytes()));
  }

  static bool verifyPSS(String signature, String message, Hash hash,
      SaltLength saltLength, String publicKey) {
    var requestBuilder = model.VerifyPssrequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.boolResponse(
        RSABridge.callSync("verifyPSS", requestBuilder.toBytes()));
  }

  static bool verifyPSSBytes(Uint8List signature, Uint8List message, Hash hash,
      SaltLength saltLength, String publicKey) {
    var requestBuilder = model.VerifyPssbytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.boolResponse(
        RSABridge.callSync("verifyPSSBytes", requestBuilder.toBytes()));
  }

  static bool verifyPKCS1v15(
      String signature, String message, Hash hash, String publicKey) {
    var requestBuilder = model.VerifyPkcs1v15RequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.boolResponse(
        RSABridge.callSync("verifyPKCS1v15", requestBuilder.toBytes()));
  }

  static bool verifyPKCS1v15Bytes(
      Uint8List signature, Uint8List message, Hash hash, String publicKey) {
    var requestBuilder = model.VerifyPkcs1v15BytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.boolResponse(
        RSABridge.callSync("verifyPKCS1v15Bytes", requestBuilder.toBytes()));
  }

  static String hash(String message, Hash hash) {
    var requestBuilder = model.HashRequestObjectBuilder(
      message: message,
      hash: model.Hash.values[hash.index],
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("hash", requestBuilder.toBytes()));
  }

  static String base64(String message) {
    var requestBuilder = model.Base64RequestObjectBuilder(
      message: message,
    );

    return RSAResponseHandlers.stringResponse(
        RSABridge.callSync("base64", requestBuilder.toBytes()));
  }

  static KeyPair generate(int bits) {
    var requestBuilder = model.GenerateRequestObjectBuilder(
      nBits: bits,
    );

    return RSAResponseHandlers.keyPairResponse(
        RSABridge.callSync("generate", requestBuilder.toBytes()));
  }
}
