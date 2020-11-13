import 'dart:convert';
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

class SignAndVerifyPSSBytes extends StatefulWidget {
  const SignAndVerifyPSSBytes({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _SignAndVerifyPSSBytesState createState() => _SignAndVerifyPSSBytesState();
}

class _SignAndVerifyPSSBytesState extends State<SignAndVerifyPSSBytes> {
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
                var result = await RSA.signPSSBytes(
                  Uint8List.fromList(controller.text.codeUnits),
                  Hash.HASH_SHA256,
                  SaltLength.SALTLENGTH_AUTO,
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
              key: Key("verify"),
              result: _valid,
              onPressed: () async {
                var result = await RSA.verifyPSSBytes(
                  base64Decode(_signed),
                  Uint8List.fromList(_text.codeUnits),
                  Hash.HASH_SHA256,
                  SaltLength.SALTLENGTH_AUTO,
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
