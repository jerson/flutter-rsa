import 'dart:async';
import 'dart:typed_data';

class Binding {
  static final Binding _singleton = Binding._internal();

  factory Binding() {
    return _singleton;
  }

  Binding._internal();

  Future<Uint8List> callAsync(String name, Uint8List payload) async {
    return Uint8List.fromList(''.codeUnits);
  }

  bool isSupported() {
    return false;
  }
}
