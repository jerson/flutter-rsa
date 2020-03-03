# fast_rsa_hover

The hover implementation of [`fast_rsa`][1].

## Usage

### Import the package

To use this plugin in your Flutter Hover app, simply add it as a dependency in
your pubspec alongside the base `fast_rsa` plugin.

This is what the above means to your `pubspec.yaml`:

```yaml
...
dependencies:
  ...
  fast_rsa: ^0.6.0
  ...
```

This is what the above means to your `go/options.go`:

```go
package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	rsa "github.com/jerson/flutter-rsa/fast_rsa_hover"
)

var options = []flutter.Option{
	...,
	flutter.AddPlugin(&rsa.Plugin{}),
}

```

### Use the plugin

Once you have the `&rsa.Plugin{}` dependency in your `go/options.go`, you should
be able to use `package:fast_rsa` as normal.

[1]: ../fast_rsa/README.md
