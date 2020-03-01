# fast_rsa_web

The web implementation of [`fast_rsa`][1].

## Usage

### Import the package

To use this plugin in your Flutter Web app, simply add it as a dependency in
your pubspec alongside the base `fast_rsa` plugin.

_(This is only temporary: in the future we hope to make this package an
"endorsed" implementation of `fast_rsa`, so that it is automatically
included in your Flutter Web app when you depend on `package:fast_rsa`.)_

This is what the above means to your `pubspec.yaml`:

```yaml
...
dependencies:
  ...
  fast_rsa: ^0.6.0
  fast_rsa_web: ^0.1.0
  ...
```

### Use the plugin

Once you have the `fast_rsa_web` dependency in your pubspec, you should
be able to use `package:fast_rsa` as normal.

[1]: ../fast_rsa
