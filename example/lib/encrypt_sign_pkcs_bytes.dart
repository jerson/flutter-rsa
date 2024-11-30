import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class SignAndVerifyPKCSBytes extends StatefulWidget {
  const SignAndVerifyPKCSBytes({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _SignAndVerifyPKCSBytesState createState() => _SignAndVerifyPKCSBytesState();
}

class _SignAndVerifyPKCSBytesState extends State<SignAndVerifyPKCSBytes> {
  String _signed = "";
  String _text = "";
  String _valid = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            InputWidget(
              title: "Sign",
              key: const Key("sign"),
              result: _signed,
              onPressed: (controller) async {
                var result = await RSA.signPKCS1v15Bytes(
                  Uint8List.fromList(controller.text.codeUnits),
                  Hash.SHA256,
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _text = controller.text;
                  _signed = base64Encode(result);
                });
              },
            ),
            ButtonWidget(
              title: "Verify",
              key: const Key("verify"),
              result: _valid,
              onPressed: () async {
                var result = await RSA.verifyPKCS1v15Bytes(
                  base64Decode(_signed),
                  Uint8List.fromList(_text.codeUnits),
                  Hash.SHA256,
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _valid = result ? "VALID" : "INVALID";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
