import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fast_rsa/bridge/binding_stub.dart'
    if (dart.library.io) 'package:fast_rsa/bridge/binding.dart'
    if (dart.library.js) 'package:fast_rsa/bridge/binding_stub.dart';
import 'package:fast_rsa/model/bridge_model_generated.dart' as model;

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

class RSA {
  static const MethodChannel _channel = const MethodChannel('fast_rsa');
  static bool bindingEnabled = Binding().isSupported();

  static Future<Uint8List> _call(String name, Uint8List payload) async {
    if (bindingEnabled) {
      return await Binding().callAsync(name, payload);
    }
    return await _channel.invokeMethod(name, payload);
  }

  static Future<Uint8List> _bytesResponse(
      String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = model.BytesResponse(data);
    if (response.error != null && response.error != "") {
      throw new RSAException(response.error!);
    }
    return Uint8List.fromList(response.output!);
  }

  static Future<String> _stringResponse(String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = model.StringResponse(data);
    if (response.error != null && response.error != "") {
      throw new RSAException(response.error!);
    }
    return response.output!;
  }

  static Future<bool> _boolResponse(String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = model.BoolResponse(data);
    if (response.error != null && response.error != "") {
      throw new RSAException(response.error!);
    }
    return response.output;
  }

  static Future<KeyPair> _keyPairResponse(
      String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = model.KeyPairResponse(data);
    if (response.error != null && response.error != "") {
      throw new RSAException(response.error!);
    }
    var output = response.output!;
    return KeyPair(output.publicKey!, output.privateKey!);
  }

  static Future<PKCS12KeyPair> _pkcs12KeyPairResponse(
      String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = model.PKCS12KeyPairResponse(data);
    if (response.error != null && response.error != "") {
      throw new RSAException(response.error!);
    }
    var output = response.output!;
    return PKCS12KeyPair(
        output.publicKey!, output.privateKey!, output.certificate!);
  }

  static Future<String> convertJWKToPrivateKey(
      dynamic data, String keyId) async {
    var requestBuilder = model.ConvertJWTRequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return await _stringResponse(
        "convertJWKToPrivateKey", requestBuilder.toBytes());
  }

  static Future<String> convertJWKToPublicKey(
      dynamic data, String keyId) async {
    var requestBuilder = model.ConvertJWTRequestObjectBuilder(
      data: jsonEncode(data),
      keyId: keyId,
    );

    return await _stringResponse(
        "convertJWKToPublicKey", requestBuilder.toBytes());
  }

  static Future<String> convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) async {
    var requestBuilder = model.ConvertKeyPairRequestObjectBuilder(
      certificate: certificate,
      password: password,
      privateKey: privateKey,
    );

    return await _stringResponse(
        "convertKeyPairToPKCS12", requestBuilder.toBytes());
  }

  static Future<PKCS12KeyPair> convertPKCS12ToKeyPair(
      String pkcs12, String password) async {
    var requestBuilder = model.ConvertPKCS12RequestObjectBuilder(
      password: password,
      pkcs12: pkcs12,
    );

    return await _pkcs12KeyPairResponse(
        "convertPKCS12ToKeyPair", requestBuilder.toBytes());
  }

  static Future<String> convertPrivateKeyToPKCS8(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return await _stringResponse(
        "convertPrivateKeyToPKCS8", requestBuilder.toBytes());
  }

  static Future<String> convertPrivateKeyToPKCS1(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return await _stringResponse(
        "convertPrivateKeyToPKCS1", requestBuilder.toBytes());
  }

  static Future<dynamic> convertPrivateKeyToJWK(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return jsonDecode(await _stringResponse(
        "convertPrivateKeyToJWK", requestBuilder.toBytes()));
  }

  static Future<String> convertPrivateKeyToPublicKey(String privateKey) async {
    var requestBuilder = model.ConvertPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
    );

    return await _stringResponse(
        "convertPrivateKeyToPublicKey", requestBuilder.toBytes());
  }

  static Future<String> convertPublicKeyToPKIX(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return await _stringResponse(
        "convertPublicKeyToPKIX", requestBuilder.toBytes());
  }

  static Future<String> convertPublicKeyToPKCS1(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return await _stringResponse(
        "convertPublicKeyToPKCS1", requestBuilder.toBytes());
  }

  static Future<dynamic> convertPublicKeyToJWK(String publicKey) async {
    var requestBuilder = model.ConvertPublicKeyRequestObjectBuilder(
      publicKey: publicKey,
    );

    return jsonDecode(await _stringResponse(
        "convertPublicKeyToJWK", requestBuilder.toBytes()));
  }

  static Future<String> decryptPrivateKey(
      String privateKeyEncrypted, String password) async {
    var requestBuilder = model.DecryptPrivateKeyRequestObjectBuilder(
      privateKeyEncrypted: privateKeyEncrypted,
      password: password,
    );

    return await _stringResponse("decryptPrivateKey", requestBuilder.toBytes());
  }

  static Future<String> encryptPrivateKey(
      String privateKey, String password, PEMCipher cipher) async {
    var requestBuilder = model.EncryptPrivateKeyRequestObjectBuilder(
      privateKey: privateKey,
      password: password,
      cipher: model.PEMCipher.values[cipher.index],
    );

    return await _stringResponse("encryptPrivateKey", requestBuilder.toBytes());
  }

  static Future<String> decryptOAEP(
      String ciphertext, String label, Hash hash, String privateKey) async {
    var requestBuilder = model.DecryptOAEPRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return await _stringResponse("decryptOAEP", requestBuilder.toBytes());
  }

  static Future<Uint8List> decryptOAEPBytes(
      Uint8List ciphertext, String label, Hash hash, String privateKey) async {
    var requestBuilder = model.DecryptOAEPBytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
      label: label,
      hash: model.Hash.values[hash.index],
    );

    return await _bytesResponse("decryptOAEPBytes", requestBuilder.toBytes());
  }

  static Future<String> decryptPKCS1v15(
      String ciphertext, String privateKey) async {
    var requestBuilder = model.DecryptPKCS1v15RequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return await _stringResponse("decryptPKCS1v15", requestBuilder.toBytes());
  }

  static Future<Uint8List> decryptPKCS1v15Bytes(
      Uint8List ciphertext, String privateKey) async {
    var requestBuilder = model.DecryptPKCS1v15BytesRequestObjectBuilder(
      privateKey: privateKey,
      ciphertext: ciphertext,
    );

    return await _bytesResponse(
        "decryptPKCS1v15Bytes", requestBuilder.toBytes());
  }

  static Future<String> encryptOAEP(
      String message, String label, Hash hash, String publicKey) async {
    var requestBuilder = model.EncryptOAEPRequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return await _stringResponse("encryptOAEP", requestBuilder.toBytes());
  }

  static Future<Uint8List> encryptOAEPBytes(
      Uint8List message, String label, Hash hash, String publicKey) async {
    var requestBuilder = model.EncryptOAEPBytesRequestObjectBuilder(
      message: message,
      label: label,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return await _bytesResponse("encryptOAEPBytes", requestBuilder.toBytes());
  }

  static Future<String> encryptPKCS1v15(
      String message, String publicKey) async {
    var requestBuilder = model.EncryptPKCS1v15RequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return await _stringResponse("encryptPKCS1v15", requestBuilder.toBytes());
  }

  static Future<Uint8List> encryptPKCS1v15Bytes(
      Uint8List message, String publicKey) async {
    var requestBuilder = model.EncryptPKCS1v15BytesRequestObjectBuilder(
      message: message,
      publicKey: publicKey,
    );

    return await _bytesResponse(
        "encryptPKCS1v15Bytes", requestBuilder.toBytes());
  }

  static Future<String> signPSS(String message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var requestBuilder = model.SignPSSRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return await _stringResponse("signPSS", requestBuilder.toBytes());
  }

  static Future<Uint8List> signPSSBytes(Uint8List message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var requestBuilder = model.SignPSSBytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return await _bytesResponse("signPSSBytes", requestBuilder.toBytes());
  }

  static Future<String> signPKCS1v15(
      String message, Hash hash, String privateKey) async {
    var requestBuilder = model.SignPKCS1v15RequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return await _stringResponse("signPKCS1v15", requestBuilder.toBytes());
  }

  static Future<Uint8List> signPKCS1v15Bytes(
      Uint8List message, Hash hash, String privateKey) async {
    var requestBuilder = model.SignPKCS1v15BytesRequestObjectBuilder(
      message: message,
      privateKey: privateKey,
      hash: model.Hash.values[hash.index],
    );

    return await _bytesResponse("signPKCS1v15Bytes", requestBuilder.toBytes());
  }

  static Future<bool> verifyPSS(String signature, String message, Hash hash,
      SaltLength saltLength, String publicKey) async {
    var requestBuilder = model.VerifyPSSRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return await _boolResponse("verifyPSS", requestBuilder.toBytes());
  }

  static Future<bool> verifyPSSBytes(Uint8List signature, Uint8List message,
      Hash hash, SaltLength saltLength, String publicKey) async {
    var requestBuilder = model.VerifyPSSBytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      saltLength: model.SaltLength.values[saltLength.index],
      hash: model.Hash.values[hash.index],
    );

    return await _boolResponse("verifyPSSBytes", requestBuilder.toBytes());
  }

  static Future<bool> verifyPKCS1v15(
      String signature, String message, Hash hash, String publicKey) async {
    var requestBuilder = model.VerifyPKCS1v15RequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return await _boolResponse("verifyPKCS1v15", requestBuilder.toBytes());
  }

  static Future<bool> verifyPKCS1v15Bytes(Uint8List signature,
      Uint8List message, Hash hash, String publicKey) async {
    var requestBuilder = model.VerifyPKCS1v15BytesRequestObjectBuilder(
      message: message,
      signature: signature,
      publicKey: publicKey,
      hash: model.Hash.values[hash.index],
    );

    return await _boolResponse("verifyPKCS1v15Bytes", requestBuilder.toBytes());
  }

  static Future<String> hash(String message, Hash hash) async {
    var requestBuilder = model.HashRequestObjectBuilder(
      message: message,
      hash: model.Hash.values[hash.index],
    );

    return await _stringResponse("hash", requestBuilder.toBytes());
  }

  static Future<String> base64(String message) async {
    var requestBuilder = model.Base64RequestObjectBuilder(
      message: message,
    );

    return await _stringResponse("base64", requestBuilder.toBytes());
  }

  static Future<KeyPair> generate(int bits) async {
    var requestBuilder = model.GenerateRequestObjectBuilder(
      nBits: bits,
    );

    return await _keyPairResponse("generate", requestBuilder.toBytes());
  }
}
