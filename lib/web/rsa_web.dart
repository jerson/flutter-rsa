import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart';

class FastRsaPlugin {
  var _counter = 0;
  Worker worker = Worker(
    'assets/packages/fast_rsa/web/assets/worker.js'.toJS,
  );
  Map<String, Completer<Uint8List>> completers = {};

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'fast_rsa',
      const StandardMethodCodec(),
      // ignore: deprecated_member_use
      registrar.messenger,
    );
    final FastRsaPlugin instance = FastRsaPlugin();
    instance.listen();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    return await bridgeCall(call.method, call.arguments);
  }

  void listen() async {
    void _onMessage(Event event) {
      final msgEvent = event as MessageEvent;
      final data = msgEvent.data as RsaResponse;
      var completer = completers[data.id];
      if (completer == null) {
        return;
      }
      if (data.error != null && data.error! != '') {
        completer.completeError(data.error!);
      } else {
        completer.complete(data.response?.toDart);
      }
      completers.remove(data.id);
    }

    worker.onmessage = _onMessage.toJS;
    // worker.addEventListener('message', _onMessage.toJS);
  }

  Future<Uint8List> bridgeCall(String name, Uint8List? /*!*/ request) async {
    _counter++;
    var id = _counter.toString();
    var completer = new Completer<Uint8List>();
    completers[id] = completer;
    worker.postMessage(RsaRequest(
      id: id,
      name: name,
      request: request?.toJS,
    ));
    return completer.future;
  }
}

@JS()
@anonymous
extension type RsaRequest._(JSObject _) implements JSObject {
  external String id;
  external String name;
  external JSUint8Array? request;

  external RsaRequest({
    String id,
    String name,
    JSUint8Array? request,
  });
}

@JS()
@anonymous
extension type RsaResponse._(JSObject _) implements JSObject {
  external String id;
  external String? error;
  external JSUint8Array? response;

  external RsaResponse({
    String id,
    String? error,
    JSUint8Array? response,
  });
}
