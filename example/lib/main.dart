import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fast_rsa/rsa.dart';
import 'package:fast_rsa/model/bridge.pb.dart' as pb;
import 'package:rsa_example/base64.dart';
import 'package:rsa_example/convert_jwt.dart';
import 'package:rsa_example/convert_keypair.dart';
import 'package:rsa_example/convert_private.dart';
import 'package:rsa_example/convert_public.dart';
import 'package:rsa_example/encrypt_decrypt_oaep.dart';
import 'package:rsa_example/encrypt_decrypt_oaep_bytes.dart';
import 'package:rsa_example/encrypt_decrypt_pkcs.dart';
import 'package:rsa_example/encrypt_decrypt_pkcs_bytes.dart';
import 'package:rsa_example/encrypt_sign_pkcs.dart';
import 'package:rsa_example/encrypt_sign_pkcs_bytes.dart';
import 'package:rsa_example/encrypt_sign_pss.dart';
import 'package:rsa_example/encrypt_sign_pss_bytes.dart';
import 'package:rsa_example/generate.dart';
import 'package:rsa_example/hash.dart';

const password = '123456789';
const pkcs12 =
    '''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''';

void main() {
  if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  pb.PKCS12KeyPair _pkcs12KeyPair = pb.PKCS12KeyPair()
    ..privateKey = ""
    ..publicKey = ""
    ..certificate = "";

  @override
  void initState() {
    super.initState();
    convertKey();
  }

  void convertKey() async {
    try {
      var data = await RSA.convertPKCS12ToKeyPair(pkcs12, password);
      setState(() {
        _pkcs12KeyPair = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RSA example app'),
        ),
        body: ListView(
          key: Key("list"),
          children: <Widget>[
            EncryptAndDecryptOAEP(
              title: "Encrypt and Decrypt OAEP",
              keyPair: _pkcs12KeyPair,
              key: Key("encrypt-oaep"),
            ),
            EncryptAndDecryptOAEPBytes(
              title: "Encrypt and Decrypt OAEP Bytes",
              keyPair: _pkcs12KeyPair,
              key: Key("encrypt-oaep-bytes"),
            ),
            EncryptAndDecryptPKCS(
              title: "Encrypt and Decrypt PKCS1v15",
              keyPair: _pkcs12KeyPair,
              key: Key("encrypt-pkcs"),
            ),
            EncryptAndDecryptPKCSBytes(
              title: "Encrypt and Decrypt PKCS1v15 Bytes",
              keyPair: _pkcs12KeyPair,
              key: Key("encrypt-pkcs-bytes"),
            ),
            SignAndVerifyPSS(
              title: "Sign and Verify PSS",
              keyPair: _pkcs12KeyPair,
              key: Key("sign-pss"),
            ),
            SignAndVerifyPSSBytes(
              title: "Sign and Verify PSS Bytes",
              keyPair: _pkcs12KeyPair,
              key: Key("sign-pss-bytes"),
            ),
            SignAndVerifyPKCS(
              title: "Sign and Verify PKCS",
              keyPair: _pkcs12KeyPair,
              key: Key("sign-pkcs"),
            ),
            SignAndVerifyPKCSBytes(
              title: "Sign and Verify PKCS Bytes",
              keyPair: _pkcs12KeyPair,
              key: Key("sign-pkcs-bytes"),
            ),
            Base64(
              title: "Base64",
              keyPair: _pkcs12KeyPair,
              key: Key("base64"),
            ),
            Hash(
              title: "Hash",
              keyPair: _pkcs12KeyPair,
              key: Key("hash"),
            ),
            Generate(
              title: "Generate",
              keyPair: _pkcs12KeyPair,
              key: Key("generate"),
            ),
            ConvertPrivate(
              title: "Convert PrivateKey",
              keyPair: _pkcs12KeyPair,
              key: Key("convert-private"),
            ),
            ConvertPublic(
              title: "Convert PublicKey",
              keyPair: _pkcs12KeyPair,
              key: Key("convert-public"),
            ),
            ConvertJWT(
              title: "Convert JWT",
              keyPair: _pkcs12KeyPair,
              key: Key("convert-jwt"),
            ),
            ConvertKeyPair(
              title: "Convert KeyPair",
              keyPair: _pkcs12KeyPair,
              key: Key("convert-keypair"),
            ),
          ],
        ),
      ),
    );
  }
}
