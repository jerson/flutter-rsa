import 'dart:async';

import 'package:fast_rsa_web/js/go.dart';
import 'package:fast_rsa_web/js/promise.dart';
import 'package:fast_rsa_web/js/rsa.dart';
import 'package:fast_rsa_web/js/wasm.dart';

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

    var data = await rootBundle.load('packages/fast_rsa_web/assets/rsa.wasm');
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
      case 'decryptOAEP':
        return await decryptOAEP(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'decryptPKCS1v15':
        return await decryptPKCS1v15(
          call.arguments['message'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'encryptOAEP':
        return await encryptOAEP(
          call.arguments['message'],
          call.arguments['label'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'encryptPKCS1v15':
        return await encryptPKCS1v15(
          call.arguments['message'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'signPSS':
        return await signPSS(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'signPKCS1v15':
        return await signPKCS1v15(
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'verifyPSS':
        return await verifyPSS(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
        );
      case 'verifyPKCS1v15':
        return await verifyPKCS1v15(
          call.arguments['signature'],
          call.arguments['message'],
          call.arguments['hashName'],
          call.arguments['pkcs12'],
          call.arguments['passphrase'],
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
            details: "The fast_rsa_web plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  Future<String> decryptOAEP(String message, String label, String hashName,
      String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSADecryptOAEP(message, label, hashName, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> decryptPKCS1v15(
      String message, String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSADecryptPKCS1v15(message, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> encryptOAEP(String message, String label, String hashName,
      String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSAEncryptOAEP(message, label, hashName, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> encryptPKCS1v15(
      String message, String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSAEncryptPKCS1v15(message, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> signPSS(
      String message, String hashName, String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSASignPSS(message, hashName, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<String> signPKCS1v15(
      String message, String hashName, String pkcs12, String passphrase) async {
    var completer = new Completer<String>();
    RSASignPKCS1v15(message, hashName, pkcs12, passphrase,
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<bool> verifyPSS(String signature, String message, String hashName,
      String pkcs12, String passphrase) async {
    var completer = new Completer<bool>();
    RSAVerifyPSS(signature, message, hashName, pkcs12, passphrase,
        allowInterop((String error, bool result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }

  Future<bool> verifyPKCS1v15(String signature, String message, String hashName,
      String pkcs12, String passphrase) async {
    var completer = new Completer<bool>();
    RSAVerifyPKCS1v15(signature, message, hashName, pkcs12, passphrase,
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
        "publicKey": result.publicKey,
        "privateKey": result.privateKey,
      });
    }));
    return completer.future;
  }
}
