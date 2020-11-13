import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:fast_rsa/web/js/js_go.dart';
import 'package:fast_rsa/web/js/js_promise.dart';
import 'package:fast_rsa/web/js/js_rsa_bridge.dart';
import 'package:fast_rsa/web/js/js_wasm.dart';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';

class FastRsaPlugin {
  bool _ready = false;

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'fast_rsa', const StandardMethodCodec(), registrar.messenger);
    final FastRsaPlugin instance = FastRsaPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<bool> loadInstance() async {
    if (_ready == true) {
      return true;
    }

    var data =
        await rootBundle.load('packages/fast_rsa/web/assets/rsa.wasm');
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
    return await bridgeCall(call.method, call.arguments);
  }

  Future<Uint8List> bridgeCall(String name, Uint8List payload) async {
    var completer = new Completer<Uint8List>();
    rsaBridgeCall(name, base64Encode(payload),
        allowInterop((String error, String result) {
      if (error != null && error != "") {
        completer.completeError(error);
        return;
      }
      completer.complete(base64Decode(result));
    }));
    return completer.future;
  }
}
