package rsa

import (
	"errors"

	flutter "github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	rsaMobile "github.com/jerson/rsa-mobile/rsa"
)

// Plugin ...
type Plugin struct {
	channel  *plugin.MethodChannel
	instance *rsaMobile.FastRSA
}

var _ flutter.Plugin = &Plugin{}

// InitPlugin creates a MethodChannel and set a HandleFunc
func (p *Plugin) InitPlugin(messenger plugin.BinaryMessenger) error {

	p.channel = plugin.NewMethodChannel(messenger, "rsa", plugin.StandardMethodCodec{})
	p.instance = rsaMobile.NewFastRSA()
	p.channel.HandleFunc("decryptOAEP", p.decryptOAEP)
	p.channel.HandleFunc("decryptPKCS1v15", p.decryptPKCS1v15)
	p.channel.HandleFunc("encryptOAEP", p.encryptOAEP)
	p.channel.HandleFunc("encryptPKCS1v15", p.encryptPKCS1v15)
	p.channel.HandleFunc("signPSS", p.signPSS)
	p.channel.HandleFunc("signPKCS1v15", p.signPKCS1v15)
	p.channel.HandleFunc("verifyPSS", p.verifyPSS)
	p.channel.HandleFunc("verifyPKCS1v15", p.verifyPKCS1v15)
	p.channel.HandleFunc("hash", p.hash)
	p.channel.HandleFunc("base64", p.base64)
	p.channel.HandleFunc("generate", p.generate)
	p.channel.CatchAllHandleFunc(p.catchAllTest)

	return nil
}

func (p *Plugin) decryptOAEP(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.DecryptOAEP(
		args["message"].(string),
		args["label"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) decryptPKCS1v15(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.DecryptPKCS1v15(
		args["message"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) encryptOAEP(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.EncryptOAEP(
		args["message"].(string),
		args["label"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) encryptPKCS1v15(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.EncryptPKCS1v15(
		args["message"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) signPSS(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.SignPSS(
		args["message"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) signPKCS1v15(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.SignPKCS1v15(
		args["message"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) verifyPSS(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.VerifyPSS(
		args["signature"].(string),
		args["message"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) verifyPKCS1v15(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.VerifyPKCS1v15(
		args["signature"].(string),
		args["message"].(string),
		args["hashName"].(string),
		args["pkcs12"].(string),
		args["passphrase"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) hash(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.Hash(
		args["message"].(string),
		args["name"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) base64(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.Base64(
		args["message"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) generate(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.Generate(
		int(args["bits"].(int32)),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return map[interface{}]interface{}{
		"privateKey": result.PrivateKey,
		"publicKey":  result.PublicKey,
	}, nil
}
func (p *Plugin) catchAllTest(methodCall interface{}) (reply interface{}, err error) {
	method := methodCall.(plugin.MethodCall)
	return method.Method, plugin.NewError("error", errors.New("not implemented"))
}
