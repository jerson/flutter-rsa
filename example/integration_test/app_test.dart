import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rsa_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('RSA', () {
    var input =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras orci ex, pellentesque quis lobortis in";

    var dyScroll = 200.0;
    final list = find.byType(Scrollable).first;

    group('Encrypt and Decrypt OAEP', () {
      final parent = find.byKey(ValueKey("encrypt-oaep"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));

        await expectLater(resultSelector, findsWidgets);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        await expectLater(resultSelector, findsWidgets);

        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt OAEP Bytes', () {
      final parent = find.byKey(ValueKey("encrypt-oaep-bytes"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();

        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15', () {
      final parent = find.byKey(ValueKey("encrypt-pkcs"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();

        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Encrypt and Decrypt PKCS1v15 Bytes', () {
      final parent = find.byKey(ValueKey("encrypt-pkcs-bytes"));

      testWidgets('Encrypt / Decrypt', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("decrypt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, equals(input));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS', () {
      final parent = find.byKey(ValueKey("sign-pss"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PSS Bytes', () {
      final parent = find.byKey(ValueKey("sign-pss-bytes"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS', () {
      final parent = find.byKey(ValueKey("sign-pkcs"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Sign And Verify PKCS Bytes', () {
      final parent = find.byKey(ValueKey("sign-pkcs-bytes"));

      testWidgets('Sign / Verify', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        var container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("sign")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));

        container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("verify")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        result = resultSelector.evaluate().single.widget as Text;
        expect(result.data, "VALID");
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Base64', () {
      final parent = find.byKey(ValueKey("base64"));

      testWidgets('Default', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encode")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Hash', () {
      final parent = find.byKey(ValueKey("hash"));

      testWidgets('Default', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("encode")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.enterText(
            find.descendant(
                of: container, matching: find.byKey(ValueKey("message"))),
            input);

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Generate', () {
      final parent = find.byKey(ValueKey("generate"));

      testWidgets('Default', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("action")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(minutes: 5)));
    });

    group('Convert PrivateKey', () {
      final parent = find.byKey(ValueKey("convert-private"));

      testWidgets('JWT', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("jwt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));

      testWidgets('PKCS1', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("pkcs1")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));

      testWidgets('PKCS8', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("pkcs8")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert PublicKey', () {
      final parent = find.byKey(ValueKey("convert-public"));

      testWidgets('JWT', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("jwt")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));

      testWidgets('PKCS1', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("pkcs1")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));

      testWidgets('PKIX', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("pkix")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert JWT', () {
      final parent = find.byKey(ValueKey("convert-jwt"));

      testWidgets('PrivateKey', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("private")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));

      testWidgets('PublicKey', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("public")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;

        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });

    group('Convert KeyPair', () {
      final parent = find.byKey(ValueKey("convert-keypair"));

      testWidgets('PKCS12', (WidgetTester tester) async {
        final instance = app.MyApp();
        await tester.pumpWidget(instance);
        await tester.pumpAndSettle();

        final container = find.descendant(
          of: parent,
          matching: find.byKey(ValueKey("pkcs12")),
        );
        await tester.scrollUntilVisible(container, dyScroll, scrollable: list);
        await tester.pumpAndSettle();

        await tester.tap(
          find.descendant(
              of: container, matching: find.byKey(ValueKey("button"))),
        );
        await tester.pumpAndSettle();
        var resultSelector = find.descendant(
            of: container, matching: find.byKey(ValueKey("result")));
        expect(resultSelector, findsOneWidget);
        var result = resultSelector.evaluate().single.widget as Text;
        expect(result.data != "", equals(true));
      }, timeout: Timeout(Duration(seconds: 60)));
    });
  });
}
