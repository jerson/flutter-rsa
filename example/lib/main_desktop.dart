import 'main.dart' as original_main;
import 'package:fast_rsa/fast_rsa.dart';

void main() {
  RSA.bindingEnabled = false;
  original_main.main();
}
