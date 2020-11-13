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

class ConvertJWT extends StatefulWidget {
  const ConvertJWT({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _ConvertJWTState createState() => _ConvertJWTState();
}

class _ConvertJWTState extends State<ConvertJWT> {
  String _public = "";
  String _private = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            ButtonWidget(
              title: "To PrivateKey",
              key: Key("private"),
              result: _private,
              onPressed: () async {
                var converted = await RSA.convertPrivateKeyToJWK(
                  widget.keyPair.privateKey,
                );
                var result = await RSA.convertJWKToPrivateKey(converted, "");
                setState(() {
                  _private = result;
                });
              },
            ),
            ButtonWidget(
              title: "To PublicKey",
              key: Key("public"),
              result: _public,
              onPressed: () async {
                var converted = await RSA.convertPublicKeyToJWK(
                  widget.keyPair.publicKey,
                );
                var result = await RSA.convertJWKToPublicKey(converted, "");
                setState(() {
                  _public = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
