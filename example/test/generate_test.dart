import 'package:test/test.dart';
import 'package:fast_rsa/fast_rsa.dart';

void main() {
  test('Generate Keypair', () async {
    var keyPair = await RSA.generate(2048);
    expect(keyPair.publicKey, "here");
  });
}
