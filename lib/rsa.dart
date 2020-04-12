import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';

enum RSAHash {
  md5,
  sha1,
  sha256,
  sha224,
  sha384,
  sha512,
}

enum RSAPEMCipher {
  des,
  // c3des is 3des
  c3des,
  aes128,
  aes192,
  aes256,
}

enum RSASaltLength {
  auto,
  equalsHash,
}

class KeyPair {
  final String privateKey;
  final String publicKey;

  KeyPair({
    this.publicKey,
    this.privateKey,
  });
}

class PKCS12KeyPair {
  final String privateKey;
  final String publicKey;
  final String certificate;

  PKCS12KeyPair({
    this.privateKey,
    this.publicKey,
    this.certificate,
  });
}

class RSA {
  static const MethodChannel _channel = const MethodChannel('rsa');

  static Future<String> convertJWKToPrivateKey(
      dynamic data, String keyId) async {
    return await _channel.invokeMethod('convertJWKToPrivateKey', {
      "data": jsonEncode(data),
      "keyId": keyId,
    });
  }

  static Future<String> convertJWKToPublicKey(
      dynamic data, String keyId) async {
    return await _channel.invokeMethod('convertJWKToPublicKey', {
      "data": jsonEncode(data),
      "keyId": keyId,
    });
  }

  static Future<String> convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) async {
    return await _channel.invokeMethod('convertKeyPairToPKCS12', {
      "privateKey": privateKey,
      "certificate": certificate,
      "password": password,
    });
  }

  static Future<PKCS12KeyPair> convertPKCS12ToKeyPair(
      String pkcs12, String password) async {
    var result = await _channel.invokeMethod('convertPKCS12ToKeyPair', {
      "pkcs12": pkcs12,
      "password": password,
    });
    return PKCS12KeyPair(
      privateKey: result["privateKey"],
      publicKey: result["publicKey"],
      certificate: result["certificate"],
    );
  }

  static Future<String> convertPrivateKeyToPKCS8(String privateKey) async {
    return await _channel.invokeMethod('convertPrivateKeyToPKCS8', {
      "privateKey": privateKey,
    });
  }

  static Future<String> convertPrivateKeyToPKCS1(String privateKey) async {
    return await _channel.invokeMethod('convertPrivateKeyToPKCS1', {
      "privateKey": privateKey,
    });
  }

  static Future<dynamic> convertPrivateKeyToJWK(String privateKey) async {
    var output = await _channel.invokeMethod('convertPrivateKeyToJWK', {
      "privateKey": privateKey,
    });
    return jsonDecode(output);
  }

  static Future<String> convertPrivateKeyToPublicKey(String privateKey) async {
    return await _channel.invokeMethod('convertPrivateKeyToPublicKey', {
      "privateKey": privateKey,
    });
  }

  static Future<String> convertPublicKeyToPKIX(String publicKey) async {
    return await _channel.invokeMethod('convertPublicKeyToPKIX', {
      "publicKey": publicKey,
    });
  }

  static Future<String> convertPublicKeyToPKCS1(String publicKey) async {
    return await _channel.invokeMethod('convertPublicKeyToPKCS1', {
      "publicKey": publicKey,
    });
  }

  static Future<String> convertPublicKeyToJWK(String publicKey) async {
    var output = await _channel.invokeMethod('convertPublicKeyToJWK', {
      "publicKey": publicKey,
    });
    return jsonDecode(output);
  }

  static Future<String> decryptPrivateKey(
      String privateKeyEncrypted, String password) async {
    return await _channel.invokeMethod('decryptPrivateKey', {
      "privateKeyEncrypted": privateKeyEncrypted,
      "password": password,
    });
  }

  static Future<String> encryptPrivateKey(
      String privateKey, String password, RSAPEMCipher cipherName) async {
    return await _channel.invokeMethod('encryptPrivateKey', {
      "privateKey": privateKey,
      "password": password,
      "cipherName": _toStringRSAPEMCipher(cipherName),
    });
  }

  static Future<String> decryptOAEP(
      String message, String label, RSAHash hashName, String privateKey) async {
    return await _channel.invokeMethod('decryptOAEP', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "privateKey": privateKey,
    });
  }

  static Future<String> decryptOAEPBytes(
      Uint8List message, String label, RSAHash hashName, String privateKey) async {
    return await _channel.invokeMethod('decryptOAEPBytes', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "privateKey": privateKey,
    });
  }

  static Future<String> decryptPKCS1v15(
      String message, String privateKey) async {
    return await _channel.invokeMethod('decryptPKCS1v15', {
      "message": message,
      "privateKey": privateKey,
    });
  }

  static Future<String> decryptPKCS1v15Bytes(
      Uint8List message, String privateKey) async {
    return await _channel.invokeMethod('decryptPKCS1v15Bytes', {
      "message": message,
      "privateKey": privateKey,
    });
  }

  static Future<String> encryptOAEP(
      String message, String label, RSAHash hashName, String publicKey) async {
    return await _channel.invokeMethod('encryptOAEP', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "publicKey": publicKey,
    });
  }

  static Future<String> encryptOAEPBytes(
      Uint8List message, String label, RSAHash hashName, String publicKey) async {
    return await _channel.invokeMethod('encryptOAEPBytes', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "publicKey": publicKey,
    });
  }

  static Future<String> encryptPKCS1v15(
      String message, String publicKey) async {
    return await _channel.invokeMethod('encryptPKCS1v15', {
      "message": message,
      "publicKey": publicKey,
    });
  }

  static Future<String> encryptPKCS1v15Bytes(
      Uint8List message, String publicKey) async {
    return await _channel.invokeMethod('encryptPKCS1v15Bytes', {
      "message": message,
      "publicKey": publicKey,
    });
  }

  static Future<String> signPSS(String message, RSAHash hashName,
      RSASaltLength saltLengthName, String privateKey) async {
    return await _channel.invokeMethod('signPSS', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "saltLengthName": _toStringRSASaltLength(saltLengthName),
      "privateKey": privateKey,
    });
  }

  static Future<String> signPSSBytes(Uint8List message, RSAHash hashName,
      RSASaltLength saltLengthName, String privateKey) async {
    return await _channel.invokeMethod('signPSSBytes', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "saltLengthName": _toStringRSASaltLength(saltLengthName),
      "privateKey": privateKey,
    });
  }

  static Future<String> signPKCS1v15(
      String message, RSAHash hashName, String privateKey) async {
    return await _channel.invokeMethod('signPKCS1v15', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "privateKey": privateKey,
    });
  }

  static Future<String> signPKCS1v15Bytes(
      Uint8List message, RSAHash hashName, String privateKey) async {
    return await _channel.invokeMethod('signPKCS1v15Bytes', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "privateKey": privateKey,
    });
  }

  static Future<bool> verifyPSS(String signature, String message,
      RSAHash hashName, RSASaltLength saltLengthName, String publicKey) async {
    return await _channel.invokeMethod('verifyPSS', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "saltLengthName": _toStringRSASaltLength(saltLengthName),
      "publicKey": publicKey,
    });
  }

  static Future<bool> verifyPSSBytes(Uint8List signature, Uint8List message,
      RSAHash hashName, RSASaltLength saltLengthName, String publicKey) async {
    return await _channel.invokeMethod('verifyPSSBytes', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "saltLengthName": _toStringRSASaltLength(saltLengthName),
      "publicKey": publicKey,
    });
  }

  static Future<bool> verifyPKCS1v15(String signature, String message,
      RSAHash hashName, String publicKey) async {
    return await _channel.invokeMethod('verifyPKCS1v15', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "publicKey": publicKey,
    });
  }

  static Future<bool> verifyPKCS1v15Bytes(Uint8List signature, Uint8List message,
      RSAHash hashName, String publicKey) async {
    return await _channel.invokeMethod('verifyPKCS1v15Bytes', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "publicKey": publicKey,
    });
  }

  static Future<String> hash(String message, RSAHash name) async {
    return await _channel.invokeMethod('hash', {
      "message": message,
      "name": _toStringRSAHash(name),
    });
  }

  static Future<String> base64(String message) async {
    return await _channel.invokeMethod('base64', {
      "message": message,
    });
  }

  static Future<KeyPair> generate(int bits) async {
    var result = await _channel.invokeMethod('generate', {
      "bits": bits,
    });

    return KeyPair(
      privateKey: result["privateKey"],
      publicKey: result["publicKey"],
    );
  }

  static String _toStringRSAHash(RSAHash input) {
    if (input == null) {
      input = RSAHash.sha512;
    }
    return input.toString().replaceFirst("RSAHash.", "");
  }

  static String _toStringRSASaltLength(RSASaltLength input) {
    if (input == null) {
      input = RSASaltLength.auto;
    }
    return input.toString().replaceFirst("RSASaltLength.", "");
  }

  static String _toStringRSAPEMCipher(RSAPEMCipher input) {
    if (input == null) {
      input = RSAPEMCipher.aes256;
    }
    return input
        .toString()
        .replaceFirst("RSAPEMCipher.", "")
        .replaceFirst("c3des", "3des");
  }
}
