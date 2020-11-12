import 'dart:isolate';
import 'dart:typed_data';

class IsolateArguments {
  final String name;
  final Uint8List payload;
  final SendPort port;

  IsolateArguments(this.name, this.payload, this.port);
}
