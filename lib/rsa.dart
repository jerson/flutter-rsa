import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rsa/key_pair.dart';

enum RSAHash {
  md5,
  sha1,
  sha256,
  sha224,
  sha384,
  sha512,
}

class RSA {
  static const MethodChannel _channel = const MethodChannel('rsa');

  static Future<String> decryptOAEP(String message, String label,
      RSAHash hashName, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('decryptOAEP', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<String> decryptPKCS1v15(
      String message, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('decryptPKCS1v15', {
      "message": message,
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<String> encryptOAEP(String message, String label,
      RSAHash hashName, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('encryptOAEP', {
      "message": message,
      "label": label,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<String> encryptPKCS1v15(
      String message, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('encryptPKCS1v15', {
      "message": message,
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<String> signPSS(String message, RSAHash hashName, String pkcs12,
      String passphrase) async {
    return await _channel.invokeMethod('signPSS', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<String> signPKCS1v15(String message, RSAHash hashName,
      String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('signPKCS1v15', {
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<bool> verifyPSS(String signature, String message,
      RSAHash hashName, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('verifyPSS', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
    });
  }

  static Future<bool> verifyPKCS1v15(String signature, String message,
      RSAHash hashName, String pkcs12, String passphrase) async {
    return await _channel.invokeMethod('verifyPKCS1v15', {
      "signature": signature,
      "message": message,
      "hashName": _toStringRSAHash(hashName),
      "pkcs12": pkcs12,
      "passphrase": passphrase,
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
}
