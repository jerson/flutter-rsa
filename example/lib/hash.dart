import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fast_rsa/rsa.dart';
import 'package:fast_rsa/model/bridge.pb.dart' as pb;
import 'package:rsa_example/main.dart';
import 'package:rsa_example/shared/button_widget.dart';
import 'package:rsa_example/shared/input_widget.dart';
import 'package:rsa_example/shared/title_widget.dart';

class Hash extends StatefulWidget {
  const Hash({
    Key key,
    @required this.title,
    @required pb.PKCS12KeyPair keyPair,
  })  : keyPair = keyPair,
        super(key: key);

  final pb.PKCS12KeyPair keyPair;
  final String title;

  @override
  _HashState createState() => _HashState();
}

class _HashState extends State<Hash> {
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
                var encrypted =
                    await RSA.hash(controller.text, pb.Hash.HASH_SHA512);
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
