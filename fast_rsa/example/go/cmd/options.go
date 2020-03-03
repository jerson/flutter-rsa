package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	rsa "github.com/jerson/flutter-rsa/fast_rsa_hover"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(800, 1280),
	flutter.AddPlugin(&rsa.Plugin{}),
}
