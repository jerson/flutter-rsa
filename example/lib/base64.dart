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

class Base64 extends StatefulWidget {
  const Base64({
    Key key,
    @required this.title,
    @required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _Base64State createState() => _Base64State();
}

class _Base64State extends State<Base64> {
  String _encrypted = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            InputWidget(
              title: "Encode",
              key: Key("encode"),
              result: _encrypted,
              onPressed: (controller) async {
                var encrypted = await RSA.base64(
                  controller.text,
                );
                setState(() {
                  _encrypted = encrypted;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
