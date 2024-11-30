import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/main.dart';
import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class EncryptAndDecryptOAEP extends StatefulWidget {
  const EncryptAndDecryptOAEP({
    Key? key,
    required this.title,
    required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _EncryptAndDecryptOAEPState createState() => _EncryptAndDecryptOAEPState();
}

class _EncryptAndDecryptOAEPState extends State<EncryptAndDecryptOAEP> {
  String _encrypted = "";
  String _decrypted = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            TitleWidget(widget.title),
            InputWidget(
              title: "Encrypt",
              key: Key("encrypt"),
              result: _encrypted,
              onPressed: (controller) async {
                var encrypted = await RSA.encryptOAEP(
                  controller.text,
                  "",
                  Hash.SHA256,
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _encrypted = encrypted;
                });
              },
            ),
            ButtonWidget(
              title: "Decrypt",
              key: Key("decrypt"),
              result: _decrypted,
              onPressed: () async {
                var decrypted = await RSA.decryptOAEP(
                  _encrypted,
                  "",
                  Hash.SHA256,
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _decrypted = decrypted;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
