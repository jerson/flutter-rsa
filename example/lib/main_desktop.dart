import 'main.dart' as original_main;
import 'package:fast_rsa/rsa.dart';

void main() {
  RSA.bindingEnabled = false;
  original_main.main();
}
