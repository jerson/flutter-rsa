import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class Generate extends StatefulWidget {
  const Generate({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  KeyPair _keyPair = KeyPair("", "");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            ButtonWidget(
              title: "Generate",
              key: const Key("action"),
              result: _keyPair.privateKey + _keyPair.publicKey,
              onPressed: () async {
                var keyPair = await RSA.generate(2048);
                setState(() {
                  _keyPair = keyPair;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
