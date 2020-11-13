package fast_rsa

import (
	flutter "github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	rsaBridge "github.com/jerson/rsa-mobile/bridge"

	// this is a temporary fix to add missing crypto
	_ "golang.org/x/crypto/ripemd160"
)

const channelName = "fast_rsa"

// Plugin implements flutter.Plugin and handles method.
type Plugin struct {
	channel *plugin.MethodChannel
}

var _ flutter.Plugin = &Plugin{} // compile-time type check

// InitPlugin initializes the plugin.
func (p *Plugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	p.channel = plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	p.channel.CatchAllHandleFunc(p.catchAllTest)
	return nil
}

func (p *Plugin) catchAllTest(methodCall interface{}) (reply interface{}, err error) {
	method := methodCall.(plugin.MethodCall)
	return rsaBridge.Call(method.Method, method.Arguments.([]byte))
}
