import 'dart:async';
import 'dart:collection';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class FastRsaPlugin {
  var _counter = 0;
  Worker worker = new Worker('assets/packages/fast_rsa/web/assets/worker.js');
  Map<String, Completer<Uint8List>> completers = {};

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'fast_rsa',
        const StandardMethodCodec(),
        // ignore: deprecated_member_use
        registrar.messenger);
    final FastRsaPlugin instance = FastRsaPlugin();
    instance.listen();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    return await bridgeCall(call.method, call.arguments);
  }

  void listen() async {
    worker.onMessage.listen((event) {
      LinkedHashMap<dynamic, dynamic> data = event.data;
      var completer = completers[data['id']];
      if (completer == null) {
        return;
      }
      if (data['error'] != null && data['error'] != "") {
        completer.completeError(data['error']);
      } else {
        completer.complete(data['response']);
      }
      completers.remove(data['id']);
    });
  }

  Future<Uint8List> bridgeCall(String name, Uint8List request) async {
    _counter++;
    var id = _counter.toString();
    var completer = new Completer<Uint8List>();
    completers[id] = completer;
    worker.postMessage({'id': id, 'name': name, 'request': request});
    return completer.future;
  }
}
