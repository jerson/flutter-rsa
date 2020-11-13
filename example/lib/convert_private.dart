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

class ConvertPrivate extends StatefulWidget {
  const ConvertPrivate({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _ConvertPrivateState createState() => _ConvertPrivateState();
}

class _ConvertPrivateState extends State<ConvertPrivate> {
  String _jwt = "";
  String _pkcs1 = "";
  String _pkcs8 = "";
  String _publicKey = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            ButtonWidget(
              title: "To JWT",
              key: Key("jwt"),
              result: _jwt,
              onPressed: () async {
                var result = await RSA.convertPrivateKeyToJWK(
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _jwt = jsonEncode(result);
                });
              },
            ),
            ButtonWidget(
              title: "To PKCS1",
              key: Key("pkcs1"),
              result: _pkcs1,
              onPressed: () async {
                var result = await RSA.convertPrivateKeyToPKCS1(
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _pkcs1 = result;
                });
              },
            ),
            ButtonWidget(
              title: "To PKCS8",
              key: Key("pkcs8"),
              result: _pkcs8,
              onPressed: () async {
                var result = await RSA.convertPrivateKeyToPKCS8(
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _pkcs8 = result;
                });
              },
            ),
            ButtonWidget(
              title: "To PublicKey",
              key: Key("public-key"),
              result: _publicKey,
              onPressed: () async {
                var result = await RSA.convertPrivateKeyToPublicKey(
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _publicKey = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
