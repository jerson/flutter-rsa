package rsa

import (
	"errors"

	flutter "github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
)

// Plugin ...
type Plugin struct {
	channel *plugin.MethodChannel
}

var _ flutter.Plugin = &Plugin{}

// InitPlugin creates a MethodChannel and set a HandleFunc
func (p *Plugin) InitPlugin(messenger plugin.BinaryMessenger) error {

	p.channel = plugin.NewMethodChannel(messenger, "rsa", plugin.StandardMethodCodec{})
	p.channel.HandleFunc("encryptOAEP", encryptOAEP)
	p.channel.HandleFunc("decryptOAEP", decryptOAEP)
	p.channel.CatchAllHandleFunc(p.catchAllTest)

	return nil
}

func (p *Plugin) catchAllTest(methodCall interface{}) (reply interface{}, err error) {
	method := methodCall.(plugin.MethodCall)
	return method.Method, nil
}

func encryptOAEP(arguments interface{}) (reply interface{}, err error) {

	return "hello", nil
}

func decryptOAEP(arguments interface{}) (reply interface{}, err error) {
	return nil, plugin.NewError("customErrorCode", errors.New("Some error"))
}
