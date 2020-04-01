# fast_rsa

This Go package implements the host-side of the Flutter [fast_rsa](https://github.com/jerson/flutter-rsa) plugin.

## Usage

Import as:

```go
import fast_rsa "github.com/jerson/flutter-rsa/go"
```

Then add the following option to your go-flutter [application options](https://github.com/go-flutter-desktop/go-flutter/wiki/Plugin-info):

```go
flutter.AddPlugin(&fast_rsa.Plugin{}),
```
