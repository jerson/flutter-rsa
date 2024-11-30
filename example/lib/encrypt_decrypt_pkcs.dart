import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class EncryptAndDecryptPKCS extends StatefulWidget {
  const EncryptAndDecryptPKCS({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _EncryptAndDecryptPKCSState createState() => _EncryptAndDecryptPKCSState();
}

class _EncryptAndDecryptPKCSState extends State<EncryptAndDecryptPKCS> {
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
              key: const Key("encrypt"),
              result: _encrypted,
              onPressed: (controller) async {
                var encrypted = await RSA.encryptPKCS1v15(
                  controller.text,
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _encrypted = encrypted;
                });
              },
            ),
            ButtonWidget(
              title: "Decrypt",
              key: const Key("decrypt"),
              result: _decrypted,
              onPressed: () async {
                var decrypted = await RSA.decryptPKCS1v15(
                  _encrypted,
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
