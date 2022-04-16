## 3.4.7

- Added fallback option when instantiateStreaming is not available

## 3.4.6

- Fixed iOS binary
  
## 3.4.5

- Updated binaries to 1.3.3

## 3.4.4

- Updated binaries to 1.3.2
  
## 3.4.3

- Added false_secrets to pubspec

## 3.4.2

- Updated hover deps

## 3.4.1

- Updated binaries to 1.3.0 using flatbuffers 2.0
  
## 3.4.0

- Added initial support for bigger messages, see: https://github.com/jerson/rsa-mobile/commit/a6fe44834e39678b6f8628374f658eeec3779c5e

## 3.3.0

- Updated example and android requirements

## 3.2.0

- Fixed header when convert private or public key, thanks to @patachi

## 3.1.0

- Renamed rsa.dart to fast_rsa.dart to fix analysis

## 3.0.4

- Updated BUILD_BUNDLE_DIR for linux, using relative dir

## 3.0.3

- Fixed path import with spaces in cocoapods for ios

## 3.0.2

- Added fix when running on simulator "building for iOS Simulator, but linking in object file built for iOS"
## 3.0.1

- Using File.join to get a valid path for librsa_bridge.a on ios
## 3.0.0

- First version with flatbuffers, smaller binaries, please take a look
## 2.0.1

- Support import .so for older android versions, thanks to @BobanLW

## 2.0.0-nullsafety.0

- bump version to stable null_safety

## 1.4.0-nullsafety.4

- macOS now use dylib instead of .a 

## 1.4.0-nullsafety.3

- Updated FFI to latest and removed deprecated methods

## 1.4.0-nullsafety.2

- Using stable version

## 1.4.0-nullsafety.1

- First version with initial support working

## 1.4.0-nullsafety.0

- Initial support for null safety

## 1.3.6

- macOS now use dylib instead of .a 

## 1.3.5

- Added RSAException to `rsa.dart`

## 1.3.4

- Added RSAException

## 1.3.3

- Fixed panic when invalid keys are used https://github.com/jerson/flutter-rsa/issues/13

## 1.3.2

- Tests CI and github actions for drive

## 1.3.1

- Fixed web messenger
## 1.3.0

- Added wasm + web worker support

## 1.2.0

- just creating this version to replace old version

## 1.2.0-rc1

- Replaced GoMobile with binding for mostly platforms, now should be more easier add new methods and support platforms
- Platforms supported right now: macOS, iOS, Android, Hover, Windows and Linux
- Platforms partial supported: Web (need web workers)
- Added `upgrade_lib_bridge.sh` in order to update from go repo

## 1.1.4

- Updated onAttachedToEngine now using getBinaryMessenger

## 1.1.3

- Added integration test and fixed some broken methods

## 1.1.2

- Fixed macos bytes methods

## 1.1.1

- Fixed publish notes

## 1.1.0

- Added bytes methods for encrypt, decrypt and sign to web, macos, linux and hover

## 1.0.1

- Added bytes methods for encrypt, decrypt and sign

## 1.0.0

- Updated Methods, now using public key and private key for methods instead of PKCS12
- Added support for JWK
- Added methods for convert keys

## 0.9.3

- Merge conflicts

## 0.9.2

- Updated docs

## 0.9.1

- Implemented registerWith for android

## 0.9.0

- Fixed linux support and hover support

## 0.8.0

- Support for Linux, macOS and web in a single package

## 0.6.1

- Updated ignore

## 0.6.0

- Single instance for ios

## 0.5.0

- Now run on background on ios

## 0.4.0

- Fixed android, now running on background

## 0.2.0

- Fixed ios

## 0.1.0

- Initial release
