import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('RSA', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitFor(find.byValueKey("list"));
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    var input =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras orci ex, pellentesque quis lobortis in";

    var dyScroll = -300.0;
    final list = find.byValueKey("list");

    group('Encrypt and Decrypt OAEP', () {
      final parent = find.byValueKey("encrypt-oaep");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );

        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, input);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt OAEP Bytes', () {
      final parent = find.byValueKey("encrypt-oaep-bytes");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, input);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15', () {
      final parent = find.byValueKey("encrypt-pkcs");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );

        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, input);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15 Bytes', () {
      final parent = find.byValueKey("encrypt-pkcs-bytes");

      test('Encrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Decrypt', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("decrypt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, input);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS', () {
      final parent = find.byValueKey("sign-pss");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS Bytes', () {
      final parent = find.byValueKey("sign-pss-bytes");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS', () {
      final parent = find.byValueKey("sign-pkcs");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS Bytes', () {
      final parent = find.byValueKey("sign-pkcs-bytes");

      test('Sign', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("sign"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);
        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('Verify', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("verify"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Base64', () {
      final parent = find.byValueKey("base64");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encode"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Hash', () {
      final parent = find.byValueKey("hash");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("encode"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("message")),
        );
        await driver.enterText(input);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Generate', () {
      final parent = find.byValueKey("generate");

      test('Default', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("action"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(minutes: 5));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(minutes: 5)));
    });

    group('Convert PrivateKey', () {
      final parent = find.byValueKey("convert-private");

      test('JWT', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("jwt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('PKCS1', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs1"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('PKCS8', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs8"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert PublicKey', () {
      final parent = find.byValueKey("convert-public");

      test('JWT', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("jwt"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('PKCS1', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs1"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('PKIX', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkix"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert JWT', () {
      final parent = find.byValueKey("convert-jwt");

      test('PrivateKey', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("private"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));

      test('PublicKey', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("public"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);

        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert KeyPair', () {
      final parent = find.byValueKey("convert-keypair");

      test('PKCS12', () async {
        final container = find.descendant(
          of: parent,
          matching: find.byValueKey("pkcs12"),
        );
        await driver.scrollUntilVisible(list, container, dyScroll: dyScroll);

        await driver.tap(
          find.descendant(of: container, matching: find.byValueKey("button")),
        );
        var resultSelector =
            find.descendant(of: container, matching: find.byValueKey("result"));
        await driver.waitFor(resultSelector, timeout: Duration(seconds: 60));
        var result = await driver.getText(resultSelector);
        expect(result != "", true);
      }, timeout: Timeout(Duration(seconds: 60)));
    });
  });
}
