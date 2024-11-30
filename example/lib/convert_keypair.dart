import 'package:flutter/material.dart';
import 'package:fast_rsa/fast_rsa.dart';

import 'package:fast_rsa_example/main.dart';
import 'package:fast_rsa_example/shared/button_widget.dart';
import 'package:fast_rsa_example/shared/title_widget.dart';

class ConvertKeyPair extends StatefulWidget {
  const ConvertKeyPair({
    super.key,
    required this.title,
    required PKCS12KeyPair keyPair,
  }) : keyPair = keyPair;

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
              key: const Key("pkcs12"),
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
