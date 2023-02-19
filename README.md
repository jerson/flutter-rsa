# Fast RSA

Library for use RSA with support for android, ios, macos, windows, linux and web

[![Integration Tests Android](https://github.com/jerson/flutter-rsa/actions/workflows/tests_android.yml/badge.svg)](https://github.com/jerson/flutter-rsa/actions/workflows/tests_android.yml)

[![Integration Tests Linux](https://github.com/jerson/flutter-rsa/actions/workflows/tests_linux.yml/badge.svg)](https://github.com/jerson/flutter-rsa/actions/workflows/tests_linux.yml)

[![Integration Tests Windows](https://github.com/jerson/flutter-rsa/actions/workflows/tests_windows.yml/badge.svg)](https://github.com/jerson/flutter-rsa/actions/workflows/tests_windows.yml)

[![Integration Tests iOS](https://github.com/jerson/flutter-rsa/actions/workflows/tests_ios.yml/badge.svg)](https://github.com/jerson/flutter-rsa/actions/workflows/tests_ios.yml)

[![Integration Tests macOS](https://github.com/jerson/flutter-rsa/actions/workflows/tests_macos.yml/badge.svg)](https://github.com/jerson/flutter-rsa/actions/workflows/tests_macos.yml)
## Contents
 
- [Fast RSA](#fast-rsa)
  - [Contents](#contents)
  - [Usage](#usage)
    - [Encrypt methods](#encrypt-methods)
    - [Decrypt methods](#decrypt-methods)
    - [Sign methods](#sign-methods)
    - [Verify methods](#verify-methods)
    - [Generate Methods](#generate-methods)
    - [Convert Methods](#convert-methods)
    - [Util Methods](#util-methods)
  - [Setup](#setup)
    - [Android](#android)
    - [iOS](#ios)
    - [Web](#web)
    - [MacOS](#macos)
    - [Linux](#linux)
    - [Windows](#windows)
  - [Example](#example)
  - [Native Code](#native-code)

## Usage

### Encrypt methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.encryptOAEP(message, label, Hash.HASH_SHA256, publicKey)
var result = await RSA.encryptPKCS1v15(message, publicKey)

var result = await RSA.encryptOAEPBytes(messageBytes, label, Hash.SHA256, publicKey)
var result = await RSA.encryptPKCS1v15Bytes(messageBytes, publicKey)

```

### Decrypt methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.decryptOAEP(message, label, Hash.HASH_SHA256, privateKey)
var result = await RSA.decryptPKCS1v15(message, privateKey)

var result = await RSA.decryptOAEPBytes(messageBytes, label, Hash.SHA256, privateKey)
var result = await RSA.decryptPKCS1v15Bytes(messageBytes, privateKey)

```

### Sign methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.signPSS(message, Hash.SHA256, SaltLength.SALTLENGTH_AUTO, privateKey)
var result = await RSA.signPKCS1v15(message, Hash.SHA256, privateKey)

var result = await RSA.signPSSBytes(messageBytes, Hash.SHA256, SaltLength.SALTLENGTH_AUTO, privateKey)
var result = await RSA.signPKCS1v15Bytes(messageBytes, Hash.SHA256, privateKey)

```

### Verify methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.verifyPSS(signature, message, Hash.SHA256, SaltLength.SALTLENGTH_AUTO, publicKey)
var result = await RSA.verifyPKCS1v15(signature, message, Hash.SHA256, publicKey)

var result = await RSA.verifyPSSBytes(signatureBytes, messageBytes, Hash.SHA256, SaltLength.SALTLENGTH_AUTO, publicKey)
var result = await RSA.verifyPKCS1v15Bytes(signatureBytes, messageBytes, Hash.SHA256, publicKey)

```

### Generate Methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.generate(2048)

```

### Convert Methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

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

var result = await RSA.encryptPrivateKey(privateKey, password, PEMCipher.PEMCIPHER_AES256)
var result = await RSA.decryptPrivateKey(privateKeyEncrypted, password)
```

### Util Methods

```dart
import 'package:fast_rsa/fast_rsa.dart';

var result = await RSA.hash(message, Hash.SHA256)
var result = await RSA.base64(message)

```

## Setup

### Android

No additional setup required.

### iOS

No additional setup required.

### Web

add to you `pubspec.yaml`

```yaml
assets:
  - packages/fast_rsa/web/assets/worker.js
  - packages/fast_rsa/web/assets/wasm_exec.js
  - packages/fast_rsa/web/assets/rsa.wasm
```

ref: https://github.com/jerson/flutter-rsa/blob/master/example/pubspec.yaml

### MacOS

no additional setup required

### Linux

No additional setup required.

### Windows

No additional setup required.

## Example

Inside example folder

```bash
cd example && flutter run
```

check our web demo: [https://flutter-rsa.jerson.dev/]

## Native Code

the native library is made in Golang and build with gomobile for faster performance

https://github.com/jerson/rsa-mobile
