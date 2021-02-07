import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:fast_rsa/bridge/binding_stub.dart'
    if (dart.library.io) 'package:fast_rsa/bridge/binding.dart'
    if (dart.library.js) 'package:fast_rsa/bridge/binding_stub.dart';
import 'package:fast_rsa/model/bridge.pb.dart';

class RSAException implements Exception {
  String cause;
  RSAException(this.cause);
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
    var response = BytesResponse()..mergeFromBuffer(data);
    if (response.hasError()) {
      throw new RSAException(response.error);
    }
    return Uint8List.fromList(response.output);
  }

  static Future<String> _stringResponse(String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = StringResponse()..mergeFromBuffer(data);
    if (response.hasError()) {
      throw new RSAException(response.error);
    }
    return response.output;
  }

  static Future<bool> _boolResponse(String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = BoolResponse()..mergeFromBuffer(data);
    if (response.hasError()) {
      throw new RSAException(response.error);
    }
    return response.output;
  }

  static Future<KeyPair> _keyPairResponse(
      String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = KeyPairResponse()..mergeFromBuffer(data);
    if (response.hasError()) {
      throw new RSAException(response.error);
    }
    return response.output;
  }

  static Future<PKCS12KeyPair> _pkcs12KeyPairResponse(
      String name, Uint8List payload) async {
    var data = await _call(name, payload);
    var response = PKCS12KeyPairResponse()..mergeFromBuffer(data);
    if (response.hasError()) {
      throw new RSAException(response.error);
    }
    return response.output;
  }

  static Future<String> convertJWKToPrivateKey(
      dynamic data, String keyId) async {
    var request = ConvertJWTRequest()
      ..data = jsonEncode(data)
      ..keyId = keyId;

    return await _stringResponse(
        "convertJWKToPrivateKey", request.writeToBuffer());
  }

  static Future<String> convertJWKToPublicKey(
      dynamic data, String keyId) async {
    var request = ConvertJWTRequest()
      ..data = jsonEncode(data)
      ..keyId = keyId;

    return await _stringResponse(
        "convertJWKToPublicKey", request.writeToBuffer());
  }

  static Future<String> convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) async {
    var request = ConvertKeyPairRequest()
      ..privateKey = privateKey
      ..password = password
      ..certificate = certificate;

    return await _stringResponse(
        "convertKeyPairToPKCS12", request.writeToBuffer());
  }

  static Future<PKCS12KeyPair> convertPKCS12ToKeyPair(
      String pkcs12, String password) async {
    var request = ConvertPKCS12Request()
      ..pkcs12 = pkcs12
      ..password = password;

    return await _pkcs12KeyPairResponse(
        "convertPKCS12ToKeyPair", request.writeToBuffer());
  }

  static Future<String> convertPrivateKeyToPKCS8(String privateKey) async {
    var request = ConvertPrivateKeyRequest()..privateKey = privateKey;

    return await _stringResponse(
        "convertPrivateKeyToPKCS8", request.writeToBuffer());
  }

  static Future<String> convertPrivateKeyToPKCS1(String privateKey) async {
    var request = ConvertPrivateKeyRequest()..privateKey = privateKey;

    return await _stringResponse(
        "convertPrivateKeyToPKCS1", request.writeToBuffer());
  }

  static Future<dynamic> convertPrivateKeyToJWK(String privateKey) async {
    var request = ConvertPrivateKeyRequest()..privateKey = privateKey;

    return jsonDecode(await _stringResponse(
        "convertPrivateKeyToJWK", request.writeToBuffer()));
  }

  static Future<String> convertPrivateKeyToPublicKey(String privateKey) async {
    var request = ConvertPrivateKeyRequest()..privateKey = privateKey;

    return await _stringResponse(
        "convertPrivateKeyToPublicKey", request.writeToBuffer());
  }

  static Future<String> convertPublicKeyToPKIX(String publicKey) async {
    var request = ConvertPublicKeyRequest()..publicKey = publicKey;

    return await _stringResponse(
        "convertPublicKeyToPKIX", request.writeToBuffer());
  }

  static Future<String> convertPublicKeyToPKCS1(String publicKey) async {
    var request = ConvertPublicKeyRequest()..publicKey = publicKey;

    return await _stringResponse(
        "convertPublicKeyToPKCS1", request.writeToBuffer());
  }

  static Future<dynamic> convertPublicKeyToJWK(String publicKey) async {
    var request = ConvertPublicKeyRequest()..publicKey = publicKey;

    return jsonDecode(await _stringResponse(
        "convertPublicKeyToJWK", request.writeToBuffer()));
  }

  static Future<String> decryptPrivateKey(
      String privateKeyEncrypted, String password) async {
    var request = DecryptPrivateKeyRequest()
      ..privateKeyEncrypted = privateKeyEncrypted
      ..password = password;

    return await _stringResponse("decryptPrivateKey", request.writeToBuffer());
  }

  static Future<String> encryptPrivateKey(
      String privateKey, String password, PEMCipher cipher) async {
    var request = EncryptPrivateKeyRequest()
      ..privateKey = privateKey
      ..password = password
      ..cipher = cipher;

    return await _stringResponse("encryptPrivateKey", request.writeToBuffer());
  }

  static Future<String> decryptOAEP(
      String ciphertext, String label, Hash hash, String privateKey) async {
    var request = DecryptOAEPRequest()
      ..ciphertext = ciphertext
      ..label = label
      ..hash = hash
      ..privateKey = privateKey;

    return await _stringResponse("decryptOAEP", request.writeToBuffer());
  }

  static Future<Uint8List> decryptOAEPBytes(
      Uint8List ciphertext, String label, Hash hash, String privateKey) async {
    var request = DecryptOAEPBytesRequest()
      ..ciphertext = ciphertext
      ..label = label
      ..hash = hash
      ..privateKey = privateKey;

    return await _bytesResponse("decryptOAEPBytes", request.writeToBuffer());
  }

  static Future<String> decryptPKCS1v15(
      String ciphertext, String privateKey) async {
    var request = DecryptPKCS1v15Request()
      ..ciphertext = ciphertext
      ..privateKey = privateKey;

    return await _stringResponse("decryptPKCS1v15", request.writeToBuffer());
  }

  static Future<Uint8List> decryptPKCS1v15Bytes(
      Uint8List ciphertext, String privateKey) async {
    var request = DecryptPKCS1v15BytesRequest()
      ..ciphertext = ciphertext
      ..privateKey = privateKey;

    return await _bytesResponse(
        "decryptPKCS1v15Bytes", request.writeToBuffer());
  }

  static Future<String> encryptOAEP(
      String message, String label, Hash hash, String publicKey) async {
    var request = EncryptOAEPRequest()
      ..message = message
      ..label = label
      ..publicKey = publicKey
      ..hash = hash;

    return await _stringResponse("encryptOAEP", request.writeToBuffer());
  }

  static Future<Uint8List> encryptOAEPBytes(
      Uint8List message, String label, Hash hash, String publicKey) async {
    var request = EncryptOAEPBytesRequest()
      ..message = message
      ..label = label
      ..publicKey = publicKey
      ..hash = hash;

    return await _bytesResponse("encryptOAEPBytes", request.writeToBuffer());
  }

  static Future<String> encryptPKCS1v15(
      String message, String publicKey) async {
    var request = EncryptPKCS1v15Request()
      ..message = message
      ..publicKey = publicKey;

    return await _stringResponse("encryptPKCS1v15", request.writeToBuffer());
  }

  static Future<Uint8List> encryptPKCS1v15Bytes(
      Uint8List message, String publicKey) async {
    var request = EncryptPKCS1v15BytesRequest()
      ..message = message
      ..publicKey = publicKey;

    return await _bytesResponse(
        "encryptPKCS1v15Bytes", request.writeToBuffer());
  }

  static Future<String> signPSS(String message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var request = SignPSSRequest()
      ..message = message
      ..hash = hash
      ..saltLength = saltLength
      ..privateKey = privateKey;

    return await _stringResponse("signPSS", request.writeToBuffer());
  }

  static Future<Uint8List> signPSSBytes(Uint8List message, Hash hash,
      SaltLength saltLength, String privateKey) async {
    var request = SignPSSBytesRequest()
      ..message = message
      ..hash = hash
      ..saltLength = saltLength
      ..privateKey = privateKey;

    return await _bytesResponse("signPSSBytes", request.writeToBuffer());
  }

  static Future<String> signPKCS1v15(
      String message, Hash hash, String privateKey) async {
    var request = SignPKCS1v15Request()
      ..message = message
      ..hash = hash
      ..privateKey = privateKey;

    return await _stringResponse("signPKCS1v15", request.writeToBuffer());
  }

  static Future<Uint8List> signPKCS1v15Bytes(
      Uint8List message, Hash hash, String privateKey) async {
    var request = SignPKCS1v15BytesRequest()
      ..message = message
      ..hash = hash
      ..privateKey = privateKey;

    return await _bytesResponse("signPKCS1v15Bytes", request.writeToBuffer());
  }

  static Future<bool> verifyPSS(String signature, String message, Hash hash,
      SaltLength saltLength, String publicKey) async {
    var request = VerifyPSSRequest()
      ..signature = signature
      ..message = message
      ..hash = hash
      ..saltLength = saltLength
      ..publicKey = publicKey;

    return await _boolResponse("verifyPSS", request.writeToBuffer());
  }

  static Future<bool> verifyPSSBytes(Uint8List signature, Uint8List message,
      Hash hash, SaltLength saltLength, String publicKey) async {
    var request = VerifyPSSBytesRequest()
      ..signature = signature
      ..message = message
      ..hash = hash
      ..saltLength = saltLength
      ..publicKey = publicKey;

    return await _boolResponse("verifyPSSBytes", request.writeToBuffer());
  }

  static Future<bool> verifyPKCS1v15(
      String signature, String message, Hash hash, String publicKey) async {
    var request = VerifyPKCS1v15Request()
      ..signature = signature
      ..message = message
      ..hash = hash
      ..publicKey = publicKey;

    return await _boolResponse("verifyPKCS1v15", request.writeToBuffer());
  }

  static Future<bool> verifyPKCS1v15Bytes(Uint8List signature,
      Uint8List message, Hash hash, String publicKey) async {
    var request = VerifyPKCS1v15BytesRequest()
      ..signature = signature
      ..message = message
      ..hash = hash
      ..publicKey = publicKey;

    return await _boolResponse("verifyPKCS1v15Bytes", request.writeToBuffer());
  }

  static Future<String> hash(String message, Hash hash) async {
    var request = HashRequest()
      ..message = message
      ..hash = hash;

    return await _stringResponse("hash", request.writeToBuffer());
  }

  static Future<String> base64(String message) async {
    var request = Base64Request()..message = message;

    return await _stringResponse("base64", request.writeToBuffer());
  }

  static Future<KeyPair> generate(int bits) async {
    var request = GenerateRequest()..nBits = bits;

    return await _keyPairResponse("generate", request.writeToBuffer());
  }
}
