import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fast_rsa/rsa.dart';
import 'package:fast_rsa/model/bridge.pb.dart';
import 'package:rsa_example/main.dart';
import 'package:rsa_example/shared/button_widget.dart';
import 'package:rsa_example/shared/input_widget.dart';
import 'package:rsa_example/shared/title_widget.dart';

class SignAndVerifyPKCS extends StatefulWidget {
  const SignAndVerifyPKCS({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

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
              key: Key("sign"),
              result: _signed,
              onPressed: (controller) async {
                var result = await RSA.signPKCS1v15(
                  controller.text,
                  Hash.HASH_SHA256,
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
              key: Key("verify"),
              result: _valid,
              onPressed: () async {
                var result = await RSA.verifyPKCS1v15(
                  _signed,
                  _text,
                  Hash.HASH_SHA256,
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
