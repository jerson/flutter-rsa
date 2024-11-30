import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class SignAndVerifyPSS extends StatefulWidget {
  const SignAndVerifyPSS({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _SignAndVerifyPSSState createState() => _SignAndVerifyPSSState();
}

class _SignAndVerifyPSSState extends State<SignAndVerifyPSS> {
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
                var result = await RSA.signPSS(
                  controller.text,
                  Hash.SHA256,
                  SaltLength.AUTO,
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _text = controller.text;
                  _signed = result;
                });
              },
            ),
            ButtonWidget(
              title: "Verify",
              key: const Key("verify"),
              result: _valid,
              onPressed: () async {
                var result = await RSA.verifyPSS(
                  _signed,
                  _text,
                  Hash.SHA256,
                  SaltLength.AUTO,
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
