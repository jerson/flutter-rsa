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

class ConvertPublic extends StatefulWidget {
  const ConvertPublic({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _ConvertPublicState createState() => _ConvertPublicState();
}

class _ConvertPublicState extends State<ConvertPublic> {
  String _jwt = "";
  String _pkcs1 = "";
  String _pkix = "";

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
                var result = await RSA.convertPublicKeyToJWK(
                  widget.keyPair.publicKey,
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
                var result = await RSA.convertPublicKeyToPKCS1(
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _pkcs1 = result;
                });
              },
            ),
            ButtonWidget(
              title: "To PKIX",
              key: Key("pkix"),
              result: _pkix,
              onPressed: () async {
                var result = await RSA.convertPublicKeyToPKIX(
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _pkix = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
