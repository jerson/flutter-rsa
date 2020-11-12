import 'dart:async';
import 'dart:typed_data';

class Binding {
  static final Binding _singleton = Binding._internal();

  factory Binding() {
    return _singleton;
  }

  Binding._internal();

  Future<Uint8List> callAsync(String name, Uint8List payload) async {
    return null;
  }

  bool isSupported() {
    return false;
  }
}
