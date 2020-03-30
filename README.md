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

### Encrypt Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.encryptOAEP(message, label, RSAHash.sha512, publicKey)
var result = await RSA.encryptPKCS1v15(message, publicKey)

```

### Decrypt Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.decryptOAEP(message, label, RSAHash.sha512, privateKey)
var result = await RSA.decryptPKCS1v15(message, privateKey)

```

### Sign and Verify Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.signPSS(message, RSAHash.sha512, RSASaltLength.auto, privateKey)
var result = await RSA.signPKCS1v15(message, RSAHash.sha512, privateKey)
var result = await RSA.verifyPSS(signature, message, RSAHash.sha512, RSASaltLength.auto, publicKey)
var result = await RSA.verifyPKCS1v15(signature, message, RSAHash.sha512, publicKey)

```

### Generate Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.generate(2048)

```

### Convert Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.convertJWKToPrivateKey(data, keyId)
var result = await RSA.convertJWKToPublicKey(data, keyId)
var result = await RSA.convertKeyPairToPKCS12(privateKey, certificate, password)
var result = await RSA.convertPKCS12ToKeyPair(pkcs12, password)
var result = await RSA.convertPrivateKeyToPKCS8(privateKey)
var result = await RSA.convertPrivateKeyToPKCS1(privateKey)
var result = await RSA.convertPrivateKeyToJWK(privateKey)
var result = await RSA.convertPrivateKeyToPublicKey(privateKey)
var result = await RSA.convertPublicKeyToPKIX(publicKey)
var result = await RSA.convertPublicKeyToPKCS1(publicKey)
var result = await RSA.convertPublicKeyToJWK(publicKey)

var result = await RSA.encryptPrivateKey(privateKey, password, RSAPEMCipher.aes256)
var result = await RSA.decryptPrivateKey(privateKeyEncrypted, password)
```

### Util Methods

```dart
import 'package:fast_rsa/rsa.dart';

var result = await RSA.hash(message, name)
var result = await RSA.base64(message)

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
<script
  src="assets/packages/fast_rsa/web/assets/wasm_exec.js"
  type="application/javascript"
></script>
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
