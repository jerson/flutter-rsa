import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:fast_rsa/web/js/go.dart';
import 'package:fast_rsa/web/js/promise.dart';
import 'package:fast_rsa/web/js/rsa.dart';
import 'package:fast_rsa/web/js/wasm.dart';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';

class RsaPlugin {
  bool _ready = false;

  static void registerWith(Registrar registrar) {
    final MethodChannel channel =
        MethodChannel('rsa', const StandardMethodCodec(), registrar.messenger);
    final RsaPlugin instance = RsaPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<bool> loadInstance() async {
    if (_ready == true) {
      return true;
    }

    var data = await rootBundle.load('packages/fast_rsa/web/assets/rsa.wasm');
    var go = new Go();

    var result = await promiseToFutureInterop(WebAssembly.instantiate(
      data.buffer,
      go.importObject,
    ));

    promiseToFutureInterop(go.run(result.instance)).then((result) {
      consoleLog(result);
      _ready = false;
      loadInstance();
    });

    _ready = true;

    return true;
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    await loadInstance();

    switch (call.method) {
      case 'convertJWKToPrivateKey':
        return await convertJWKToPrivateKey(
          call.arguments['data'],
          call.arguments['keyId'],
        );
      case 'convertJWKToPublicKey':
        return await convertJWKToPublicKey(
          call.arguments['data'],
          call.arguments['keyId'],
        );
      case 'convertKeyPairToPKCS12':
        return await convertKeyPairToPKCS12(
          call.arguments['privateKey'],
          call.arguments['certificate'],
          call.arguments['password'],
        );
      case 'convertPKCS12ToKeyPair':
        return await convertPKCS12ToKeyPair(
          call.arguments['pkcs12'],
          call.arguments['password'],
        );
      case 'convertPrivateKeyToPKCS8':
        return await convertPrivateKeyToPKCS8(
          call.arguments['privateKey'],
        );
      case 'convertPrivateKeyToPKCS1':
        return await convertPrivateKeyToPKCS1(
          call.arguments['privateKey'],
        );
      case 'convertPrivateKeyToJWK':
        return await convertPrivateKeyToJWK(
          call.arguments['privateKey'],
        );
      case 'convertPrivateKeyToPublicKey':
        return await convertPrivateKeyToPublicKey(
          call.arguments['privateKey'],
        );
      case 'convertPublicKeyToPKIX':
        return await convertPublicKeyToPKIX(
          call.arguments['publicKey'],
        );
      case 'convertPublicKeyToPKCS1':
        return await convertPublicKeyToPKCS1(
          call.arguments['publicKey'],
        );
      case 'convertPublicKeyToJWK':
        return await convertPublicKeyToJWK(
          call.arguments['publicKey'],
        );
      case 'decryptPrivateKey':
        return await decryptPrivateKey(
          call.arguments['privateKeyEncrypted'],
          call.arguments['password'],
        );
      case 'encryptPrivateKey':
        return await encryptPrivateKey(
          call.arguments['privateKey'],
          call.arguments['password'],
          call.arguments['cipherName'],
        );
      case 'decryptOAEP':
        return await decryptOAEP(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['privateKey'],
        );
      case 'decryptOAEPBytes':
        return await decryptOAEPBytes(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['privateKey'],
        );
      case 'decryptPKCS1v15':
        return await decryptPKCS1v15(
          call.arguments['message'],
          call.arguments['privateKey'],
        );
      case 'decryptPKCS1v15Bytes':
        return await decryptPKCS1v15Bytes(
          call.arguments['message'],
          call.arguments['privateKey'],
        );
      case 'encryptOAEP':
        return await encryptOAEP(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['publicKey'],
        );
      case 'encryptOAEPBytes':
        return await encryptOAEPBytes(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['publicKey'],
        );
      case 'encryptPKCS1v15':
        return await encryptPKCS1v15(
          call.arguments['message'],
          call.arguments['publicKey'],
        );
      case 'encryptPKCS1v15Bytes':
        return await encryptPKCS1v15Bytes(
          call.arguments['message'],
          call.arguments['publicKey'],
        );
      case 'signPSS':
        return await signPSS(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['saltLengthName'],
          call.arguments['privateKey'],
        );
      case 'signPSSBytes':
        return await signPSSBytes(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['saltLengthName'],
          call.arguments['privateKey'],
        );
      case 'signPKCS1v15':
        return await signPKCS1v15(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['privateKey'],
        );
      case 'signPKCS1v15Bytes':
        return await signPKCS1v15Bytes(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['privateKey'],
        );
      case 'verifyPSS':
        return await verifyPSS(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['saltLengthName'],
          call.arguments['publicKey'],
        );
      case 'verifyPSSBytes':
        return await verifyPSSBytes(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['saltLengthName'],
          call.arguments['publicKey'],
        );
      case 'verifyPKCS1v15':
        return await verifyPKCS1v15(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['publicKey'],
        );
      case 'verifyPKCS1v15Bytes':
        return await verifyPKCS1v15Bytes(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['publicKey'],
        );
      case 'hash':
        return await hash(
          call.arguments['message'],
          call.arguments['name'],
        );
      case 'base64':
        return await base64(
          call.arguments['message'],
        );
      case 'generate':
        return await generate(
          call.arguments['bits'],
        );
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The fast_rsa plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  Future<String> convertJWKToPrivateKey(String data, String keyId) async {
    var completer = new Completer<String>();
    RSAConvertJWKToPrivateKey(data, keyId,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertJWKToPublicKey(String data, String keyId) async {
    var completer = new Completer<String>();
    RSAConvertJWKToPublicKey(data, keyId,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertKeyPairToPKCS12(
      String privateKey, String certificate, String password) async {
    var completer = new Completer<String>();
    RSAConvertKeyPairToPKCS12(privateKey, certificate, password,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<dynamic> convertPKCS12ToKeyPair(String pkcs12, String password) async {
    var completer = new Completer<dynamic>();
    RSAConvertPKCS12ToKeyPair(pkcs12, password,
        allowInterop((String error, PKCS12KeyPairObject result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete({
        "privateKey": result.privateKey,
        "publicKey": result.publicKey,
        "certificate": result.certificate,
      });
    }));
    return completer.future;
  }

  Future<String> convertPrivateKeyToPKCS8(String privateKey) async {
    var completer = new Completer<String>();
    RSAConvertPrivateKeyToPKCS8(privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertPrivateKeyToPKCS1(String privateKey) async {
    var completer = new Completer<String>();
    RSAConvertPrivateKeyToPKCS1(privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<dynamic> convertPrivateKeyToJWK(String privateKey) async {
    var completer = new Completer<dynamic>();
    RSAConvertPrivateKeyToJWK(privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertPrivateKeyToPublicKey(String privateKey) async {
    var completer = new Completer<String>();
    RSAConvertPrivateKeyToPublicKey(privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertPublicKeyToPKIX(String privateKey) async {
    var completer = new Completer<String>();
    RSAConvertPublicKeyToPKIX(privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> convertPublicKeyToPKCS1(String publicKey) async {
    var completer = new Completer<String>();
    RSAConvertPublicKeyToPKCS1(publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<dynamic> convertPublicKeyToJWK(String publicKey) async {
    var completer = new Completer<dynamic>();
    RSAConvertPublicKeyToJWK(publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> decryptPrivateKey(
      String privateKeyEncrypted, String password) async {
    var completer = new Completer<String>();
    RSADecryptPrivateKey(privateKeyEncrypted, password,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> encryptPrivateKey(
      String privateKey, String password, String cipherName) async {
    var completer = new Completer<String>();
    RSAEncryptPrivateKey(privateKey, password, cipherName,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> decryptOAEP(
      String message, String label, String hashName, String privateKey) async {
    var completer = new Completer<String>();
    RSADecryptOAEP(message, label, hashName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> decryptOAEPBytes(Uint8List message, String label,
      String hashName, String privateKey) async {
    var completer = new Completer<Uint8List>();
    RSADecryptOAEPBytes(base64Encode(message), label, hashName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<String> decryptPKCS1v15(String message, String privateKey) async {
    var completer = new Completer<String>();
    RSADecryptPKCS1v15(message, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> decryptPKCS1v15Bytes(
      Uint8List message, String privateKey) async {
    var completer = new Completer<Uint8List>();
    RSADecryptPKCS1v15Bytes(base64Encode(message), privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<String> encryptOAEP(
      String message, String label, String hashName, String publicKey) async {
    var completer = new Completer<String>();
    RSAEncryptOAEP(message, label, hashName, publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> encryptOAEPBytes(Uint8List message, String label,
      String hashName, String publicKey) async {
    var completer = new Completer<Uint8List>();
    RSAEncryptOAEPBytes(base64Encode(message), label, hashName, publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<String> encryptPKCS1v15(String message, String publicKey) async {
    var completer = new Completer<String>();
    RSAEncryptPKCS1v15(message, publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> encryptPKCS1v15Bytes(
      Uint8List message, String publicKey) async {
    var completer = new Completer<Uint8List>();
    RSAEncryptPKCS1v15Bytes(base64Encode(message), publicKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<String> signPSS(String message, String hashName, String saltLengthName,
      String privateKey) async {
    var completer = new Completer<String>();
    RSASignPSS(message, hashName, saltLengthName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> signPSSBytes(Uint8List message, String hashName,
      String saltLengthName, String privateKey) async {
    var completer = new Completer<Uint8List>();
    RSASignPSSBytes(base64Encode(message), hashName, saltLengthName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<String> signPKCS1v15(
      String message, String hashName, String privateKey) async {
    var completer = new Completer<String>();
    RSASignPKCS1v15(message, hashName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<Uint8List> signPKCS1v15Bytes(
      Uint8List message, String hashName, String privateKey) async {
    var completer = new Completer<Uint8List>();
    RSASignPKCS1v15Bytes(base64Encode(message), hashName, privateKey,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }

  Future<bool> verifyPSS(String signature, String message, String hashName,
      String saltLengthName, String publicKey) async {
    var completer = new Completer<bool>();
    RSAVerifyPSS(signature, message, hashName, saltLengthName, publicKey,
        allowInterop((String error, bool result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<bool> verifyPSSBytes(Uint8List signature, Uint8List message,
      String hashName, String saltLengthName, String publicKey) async {
    var completer = new Completer<bool>();
    RSAVerifyPSSBytes(base64Encode(signature), base64Encode(message), hashName,
        saltLengthName, publicKey, allowInterop((String error, bool result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<bool> verifyPKCS1v15(String signature, String message, String hashName,
      String publicKey) async {
    var completer = new Completer<bool>();
    RSAVerifyPKCS1v15(signature, message, hashName, publicKey,
        allowInterop((String error, bool result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<bool> verifyPKCS1v15Bytes(Uint8List signature, Uint8List message,
      String hashName, String publicKey) async {
    var completer = new Completer<bool>();
    RSAVerifyPKCS1v15Bytes(
        base64Encode(signature), base64Encode(message), hashName, publicKey,
        allowInterop((String error, bool result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> hash(String message, String name) async {
    var completer = new Completer<String>();
    RSAHash(message, name, allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> base64(String message) async {
    var completer = new Completer<String>();
    RSABase64(message, allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<dynamic> generate(int bits) async {
    var completer = new Completer<dynamic>();
    RSAGenerate(bits, allowInterop((String error, KeyPairObject result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete({
        "privateKey": result.privateKey,
        "publicKey": result.publicKey,
      });
    }));
    return completer.future;
  }
}
