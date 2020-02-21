# RSA

Library for use RSA

## Usage

```dart
import 'package:rsa/key_pair.dart';
import 'package:rsa/rsa.dart';


const passphrase = '123456789';
const pkcs12 = '''MIIQSQIBAzCCEA8GCSqGSIb3DQEHAaCCEAAEgg/8MIIP+DCCBi8GCSqGSIb3DQEH
BqCCBiAwggYcAgEAMIIGFQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQI/pTm
UKFwK/UCAggAgIIF6N5rjkv/eidrXYlkrkyl2EBNfK8hQU+cJt0lkLt6zVC+ddNW
...MORE OF YOUR PKCS12
...MORE OF YOUR PKCS12
BgUrDgMCGgUABBQ9GTbjyC/z9oi+bg8R3kdod+2+XQQINXgTTMTGIPkCAggA''';

var keyPair = await RSA.generate(2048);

var hash = await RSA.hash("text here", RSAHash.sha512);
var base64 = await RSA.base64("text here");

var encrypted = await RSA.encryptOAEP(
                            "text",
                            "",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );

var decrypted = await RSA.decryptOAEP(
                            "text encrypted",
                            "",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );

var encrypted = await RSA.encryptPKCS1v15(
                            "text",
                            pkcs12,
                            passphrase,
                          );

var decrypted = await RSA.decryptPKCS1v15(
                            "text encrypted",
                            pkcs12,
                            passphrase,
                          );

var signed = await RSA.signPSS(
                            "text",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );

var verified = await RSA.verifyPSS(
                            "signed text",
                            "text",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );

var signed = await RSA.signPKCS1v15(
                            "text",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );

var verified = await RSA.verifyPKCS1v15(
                            "signed text",
                            "text",
                            RSAHash.sha256,
                            pkcs12,
                            passphrase,
                          );


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
