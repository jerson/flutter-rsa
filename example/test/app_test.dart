import 'package:flutter/foundation.dart';
import 'package:test/test.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:fast_rsa/fast_rsa_sync.dart';

void main() {
  test('Generate Keypair', () async {
    var keyPair = await RSA.generate(1024);

    expect(keyPair, isNotNull, reason: "Key pair generation failed.");
    expect(keyPair.publicKey, isNotEmpty,
        reason: "Public key should not be empty.");
    expect(keyPair.privateKey, isNotEmpty,
        reason: "Private key should not be empty.");
  });

  test('Generate Keypair Sync/Compute', () async {
    final keyPair = await compute(
      (_) => RSASync.generate(1024),
      null,
    );

    expect(keyPair, isNotNull, reason: "Key pair generation failed.");
    expect(keyPair.publicKey, isNotEmpty,
        reason: "Public key should not be empty.");
    expect(keyPair.privateKey, isNotEmpty,
        reason: "Private key should not be empty.");

    print(keyPair.privateKey);
  });
}
