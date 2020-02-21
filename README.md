# RSA

Library for use openPGP

## Usage

```dart
import 'package:rsa/key_options.dart';
import 'package:rsa/key_pair.dart';
import 'package:rsa/rsa.dart';
import 'package:rsa/options.dart';

var keyPair = await RSA.generate(
      options: Options(
        name: 'test',
        comment: 'test',
        email: 'test@test.com',
        passphrase: "123456",
        keyOptions: KeyOptions(
            rsaBits: 2048,
            cipher: Cypher.aes128,
            compression: Compression.none,
            hash: Hash.sha256,
            compressionLevel: 0,
        ),
      ),
);


var encrypted = await RSA.encrypt("text","[publicKey here]");

var decrypted = await RSA.decrypt("text encrypted","[privateKey here]","[passphrase here]");

var signed = await RSA.sign("text","[publicKey here]","[privateKey here]","[passphrase here]");

var verified = await RSA.verify("text signed","text","[publicKey here]");

var encryptedSymmetric = await RSA.encryptSymmetric("text","[passphrase here]");

var decryptedSymmetric = await RSA.decryptSymmetric("text encrypted","[passphrase here]");

```

## ProGuard

Add this lines to `proguard-rules.pro` for proguard support

```proguard
-keep class go.** { *; }
-keep class rsa.** { *; }
```

## Sample

Inside example folder

```bash
cd example && flutter run
```

## Native Code

the native library is made in Golang and build with gomobile for faster performance

https://github.com/jerson/rsa-mobile
