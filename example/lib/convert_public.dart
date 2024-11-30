import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class ConvertPublic extends StatefulWidget {
  const ConvertPublic({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

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
              key: const Key("jwt"),
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
              key: const Key("pkcs1"),
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
              key: const Key("pkix"),
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
