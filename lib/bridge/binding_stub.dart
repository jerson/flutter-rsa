import 'dart:async';
import 'dart:typed_data';

class Binding {
  static final Binding _instance = Binding._internal();

  Binding._internal();

  factory Binding() => _instance;

  Future<Uint8List> callAsync(String name, Uint8List payload) async =>
      Uint8List(0);

  Uint8List call(String name, Uint8List payload) => Uint8List(0);

  bool isSupported() => false;
}
