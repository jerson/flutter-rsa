# Fast RSA

Library for use RSA with support for android, ios, macos, linux, web and hover

## Contents

- [Usage](#usage)
- [Setup](#setup)
  - [Android](#android)
    - [ProGuard](#proguard)
  - [iOS](#ios)
  - [Web](#web)
  - [Linux](#linux)
  - [MacOS](#macos)
  - [Hover](#hover)
- [Example](#example)
- [Native Code](#native-code)

## Usage

```dart
import 'package:fast_rsa/key_pair.dart';
import 'package:fast_rsa/rsa.dart';


const passphrase = '123456789';
const pkcs12 = '''MIIQSQIBAzCCEA8GCSqGSIb3DQEHAaCCEAAEgg/8MIIP+DCCBi8GCSqGSIb3DQEH
BqCCBiAwggYcAgEAMIIGFQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQI/pTm
UKFwK/UCAggAgIIF6N5rjkv/eidrXYlkrkyl2EBNfK8hQU+cJt0lkLt6zVC+ddNW
...MORE OF YOUR PKCS12
...MORE OF YOUR PKCS12
BgUrDgMCGgUABBQ9GTbjyC/z9oi+bg8R3kdod+2+XQQINXgTTMTGIPkCAggA''';

var encrypted = await RSA.encryptOAEP("text", "", RSAHash.sha256, pkcs12, passphrase);

var decrypted = await RSA.decryptOAEP("text encrypted", "", RSAHash.sha256, pkcs12, passphrase );

var encrypted = await RSA.encryptPKCS1v15("text", pkcs12, passphrase);

var decrypted = await RSA.decryptPKCS1v15("text encrypted", pkcs12, passphrase);

var signed = await RSA.signPSS("text", RSAHash.sha256, pkcs12, passphrase);

var verified = await RSA.verifyPSS("signed text", "text", RSAHash.sha256, pkcs12, passphrase);

var signed = await RSA.signPKCS1v15("text", RSAHash.sha256, pkcs12, passphrase);

var verified = await RSA.verifyPKCS1v15("signed text", "text", RSAHash.sha256, pkcs12, passphrase);

var keyPair = await RSA.generate(2048);

var hash = await RSA.hash("text here", RSAHash.sha512);
var base64 = await RSA.base64("text here");

```

## Setup
### Android
#### ProGuard

Add this lines to `android/app/proguard-rules.pro` for proguard support

```proguard
-keep class go.** { *; }
-keep class rsa.** { *; }
```
### iOS

no additional setup required

### Web

add to you `pubspec.yaml`

```yaml
  assets:
    - packages/fast_rsa/web/assets/wasm_exec.js
    - packages/fast_rsa/web/assets/rsa.wasm
```
ref: https://github.com/jerson/flutter-rsa/blob/master/example/pubspec.yaml


and in you `web/index.html`
```html
<script src="assets/packages/fast_rsa/web/assets/wasm_exec.js" type="application/javascript"></script>
```
ref: https://github.com/jerson/flutter-rsa/blob/master/example/web/index.html

### Linux

add to you `linux/app_configuration.mk`

```make
EXTRA_LDFLAGS=-lrsa
```
ref: https://github.com/jerson/flutter-rsa/blob/master/example/linux/app_configuration.mk

### MacOS

no additional setup required

### Hover

just update your plugins

```bash
hover plugins get
```

## Example

Inside example folder

```bash
cd example && flutter run
```

## Native Code

the native library is made in Golang and build with gomobile for faster performance

https://github.com/jerson/rsa-mobile
