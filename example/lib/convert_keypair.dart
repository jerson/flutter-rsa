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

class ConvertKeyPair extends StatefulWidget {
  const ConvertKeyPair({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _ConvertKeyPairState createState() => _ConvertKeyPairState();
}

class _ConvertKeyPairState extends State<ConvertKeyPair> {
  String _pkcs12 = "";

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
              title: "To PKCS12",
              key: Key("pkcs12"),
              result: _pkcs12,
              onPressed: () async {
                var result = await RSA.convertKeyPairToPKCS12(
                    widget.keyPair.privateKey,
                    widget.keyPair.certificate,
                    password);
                setState(() {
                  _pkcs12 = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
