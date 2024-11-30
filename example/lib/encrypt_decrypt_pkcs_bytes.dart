import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/input_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class EncryptAndDecryptPKCSBytes extends StatefulWidget {
  const EncryptAndDecryptPKCSBytes({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  })  : keyPair = keyPair;

  final PKCS12KeyPair keyPair;
  final String title;

  @override
  _EncryptAndDecryptPKCSBytesState createState() =>
      _EncryptAndDecryptPKCSBytesState();
}

class _EncryptAndDecryptPKCSBytesState
    extends State<EncryptAndDecryptPKCSBytes> {
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
                var encrypted = await RSA.encryptPKCS1v15Bytes(
                  Uint8List.fromList(controller.text.codeUnits),
                  widget.keyPair.publicKey,
                );
                setState(() {
                  _encrypted = base64Encode(encrypted);
                });
              },
            ),
            ButtonWidget(
              title: "Decrypt",
              key: const Key("decrypt"),
              result: _decrypted,
              onPressed: () async {
                var decrypted = await RSA.decryptPKCS1v15Bytes(
                  base64Decode(_encrypted),
                  widget.keyPair.privateKey,
                );
                setState(() {
                  _decrypted = String.fromCharCodes(decrypted);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
