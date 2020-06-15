import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('RSA', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    var input = "some day";

    group('Encrypt and Decrypt OAEP', () {
      final parent = find.byValueKey("encrypt-oaep");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );

        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, input);
      });
    });

    group('Encrypt and Decrypt OAEP Bytes', () {
      final parent = find.byValueKey("encrypt-oaep-bytes");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, input);
      });
    });

    group('Encrypt and Decrypt PKCS1v15', () {
      final parent = find.byValueKey("encrypt-pkcs");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );

        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, input);
      });
    });

    group('Encrypt and Decrypt PKCS1v15 Bytes', () {
      final parent = find.byValueKey("encrypt-pkcs-bytes");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, input);
      });
    });

    group('Sign And Verify PSS', () {
      final parent = find.byValueKey("sign-pss");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, "VALID");
      });
    });

    group('Sign And Verify PSS Bytes', () {
      final parent = find.byValueKey("sign-pss-bytes");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, "VALID");
      });
    });

    group('Sign And Verify PKCS', () {
      final parent = find.byValueKey("sign-pkcs");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, "VALID");
      });
    });

    group('Sign And Verify PKCS Bytes', () {
      final parent = find.byValueKey("sign-pkcs-bytes");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result, "VALID");
      });
    });

    group('Base64', () {
      final parent = find.byValueKey("base64");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encode"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });
    });

    group('Hash', () {
      final parent = find.byValueKey("hash");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encode"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });
    });

    group('Generate', () {
      final parent = find.byValueKey("generate");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("generate"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        // maybe use a better delay or wait for condition
        await Future.delayed(Duration(seconds: 6));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      }, retry: 3, timeout: Timeout(Duration(minutes: 5)));
    });

    group('Convert PrivateKey', () {
      final parent = find.byValueKey("convert-private");

      test('JWT', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("jwt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('PKCS1', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs1"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );

        expect(result != "", true);
      });

      test('PKCS8', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs8"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });
    });

    group('Convert PublicKey', () {
      final parent = find.byValueKey("convert-public");

      test('JWT', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("jwt"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('PKCS1', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs1"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('PKIX', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkix"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });
    });

    group('Convert JWT', () {
      final parent = find.byValueKey("convert-jwt");

      test('PrivateKey', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("private"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });

      test('PublicKey', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("public"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );

        expect(result != "", true);
      });
    });

    group('Convert KeyPair', () {
      final parent = find.byValueKey("convert-keypair");

      test('PKCS12', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs12"),
        );
        await driver.waitFor(container);
        await driver.scrollIntoView(container);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        await Future.delayed(Duration(seconds: 1));
        var result = await driver.getText(
          find.descendant(of: container, matching: find.byValueKey("result")),
        );
        expect(result != "", true);
      });
    });
  });
}
