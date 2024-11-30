import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class SignAndVerifyPKCS extends StatefulWidget {
  const SignAndVerifyPKCS({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _SignAndVerifyPKCSState createState() => _SignAndVerifyPKCSState();
}

class _SignAndVerifyPKCSState extends State<SignAndVerifyPKCS> {
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
                var result = await RSA.signPKCS1v15(
                  controller.text,
                  Hash.SHA256,
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
                var result = await RSA.verifyPKCS1v15(
                  _signed,
                  _text,
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
