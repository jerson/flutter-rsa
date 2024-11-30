import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fast_rsa_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('RSA', () {
    var input =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras orci ex, pellentesque quis lobortis in";

    var dyScroll = 200.0;
    final list = find.byType(Scrollable).first;

    group('Encrypt and Decrypt OAEP', () {
      final parent = find.byKey(const ValueKey("encrypt-oaep"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));

        await expectLater(resultSelector, findsWidgets);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        await expectLater(resultSelector, findsWidgets);

        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt OAEP Bytes', () {
      final parent = find.byKey(const ValueKey("encrypt-oaep-bytes"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();

        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15', () {
      final parent = find.byKey(const ValueKey("encrypt-pkcs"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();

        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15 Bytes', () {
      final parent = find.byKey(const ValueKey("encrypt-pkcs-bytes"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS', () {
      final parent = find.byKey(const ValueKey("sign-pss"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS Bytes', () {
      final parent = find.byKey(const ValueKey("sign-pss-bytes"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS', () {
      final parent = find.byKey(const ValueKey("sign-pkcs"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS Bytes', () {
      final parent = find.byKey(const ValueKey("sign-pkcs-bytes"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Base64', () {
      final parent = find.byKey(const ValueKey("base64"));

      testWidgets('Default', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encode")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Hash', () {
      final parent = find.byKey(const ValueKey("hash"));

      testWidgets('Default', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("encode")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(const ValueKey("message"))),
            input);

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Generate', () {
      final parent = find.byKey(const ValueKey("generate"));

      testWidgets('Default', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("action")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle(const Duration(seconds: 5));
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(minutes: 5)));
    });

    group('Convert PrivateKey', () {
      final parent = find.byKey(const ValueKey("convert-private"));

      testWidgets('JWT', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("jwt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));

      testWidgets('PKCS1', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("pkcs1")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));

      testWidgets('PKCS8', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("pkcs8")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Convert PublicKey', () {
      final parent = find.byKey(const ValueKey("convert-public"));

      testWidgets('JWT', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("jwt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));

      testWidgets('PKCS1', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("pkcs1")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));

      testWidgets('PKIX', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("pkix")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Convert JWT', () {
      final parent = find.byKey(const ValueKey("convert-jwt"));

      testWidgets('PrivateKey', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("private")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));

      testWidgets('PublicKey', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("public")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;

        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });

    group('Convert KeyPair', () {
      final parent = find.byKey(const ValueKey("convert-keypair"));

      testWidgets('PKCS12', (WidgetTester tester) async {
        const instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(const ValueKey("pkcs12")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(const ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(const ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: const Timeout(Duration(seconds: 60)));
    });
  });
}
