import 'dart:async';
import 'dart:html';

import 'package:fast_rsa/web/js/go.dart';
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
    var completer = new Completer<bool>();

    if (_ready == true) {
      completer.complete(true);
      return completer.future;
    }

    var request = await HttpRequest.request(
      'http://localhost:3000/rsa.wasm',
      responseType: 'arraybuffer',
      mimeType: 'application/wasm',
    );

    var go = new Go();
    WebAssembly.instantiate(
      request.response,
      go.importObject,
    ).then((result) {
      go.run(result.instance);
      _ready = true;
      completer.complete(_ready);
    }, (error) {
      completer.completeError(error);
    });

    return completer.future;
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    await loadInstance();

    switch (call.method) {
      case 'hash':
        return await _hash(call.arguments['message'], call.arguments['name']);
      case 'generate':
        return await _generate(call.arguments['bits']);
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The url_launcher plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  Future<dynamic> _generate(int bits) async {
    var completer = new Completer();
    RSAGenerate(1024, allowInterop((String error, dynamic result) {
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

  Future<dynamic> _hash(String message, String name) async {
    var completer = new Completer();
    RSAHash(message, name, allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(result);
    }));
    return completer.future;
  }
}
