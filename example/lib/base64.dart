import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class Base64 extends StatefulWidget {
  const Base64({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair;

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
              key: const Key("encode"),
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
