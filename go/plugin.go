package fast_rsa

import (
	"errors"

	flutter "github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	rsaMobile "github.com/jerson/rsa-mobile/rsa"
)

const channelName = "rsa"

// Plugin implements flutter.Plugin and handles method.
type Plugin struct {
	channel  *plugin.MethodChannel
	instance *rsaMobile.FastRSA
}

var _ flutter.Plugin = &Plugin{} // compile-time type check

// InitPlugin initializes the plugin.
func (p *Plugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	p.channel = plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	p.instance = rsaMobile.NewFastRSA()
	p.channel.HandleFunc("convertJWKToPrivateKey", p.convertJWKToPrivateKey)
	p.channel.HandleFunc("convertJWKToPublicKey", p.convertJWKToPublicKey)
	p.channel.HandleFunc("convertKeyPairToPKCS12", p.convertKeyPairToPKCS12)
	p.channel.HandleFunc("convertPKCS12ToKeyPair", p.convertPKCS12ToKeyPair)
	p.channel.HandleFunc("convertPrivateKeyToPKCS8", p.convertPrivateKeyToPKCS8)
	p.channel.HandleFunc("convertPrivateKeyToPKCS1", p.convertPrivateKeyToPKCS1)
	p.channel.HandleFunc("convertPrivateKeyToJWK", p.convertPrivateKeyToJWK)
	p.channel.HandleFunc("convertPrivateKeyToPublicKey", p.convertPrivateKeyToPublicKey)
	p.channel.HandleFunc("convertPublicKeyToPKIX", p.convertPublicKeyToPKIX)
	p.channel.HandleFunc("convertPublicKeyToPKCS1", p.convertPublicKeyToPKCS1)
	p.channel.HandleFunc("convertPublicKeyToJWK", p.convertPublicKeyToJWK)
	p.channel.HandleFunc("decryptPrivateKey", p.decryptPrivateKey)
	p.channel.HandleFunc("encryptPrivateKey", p.encryptPrivateKey)
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

func (p *Plugin) convertJWKToPrivateKey(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertJWKToPrivateKey(
		args["data"].(string),
		args["keyId"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertJWKToPublicKey(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertJWKToPublicKey(
		args["data"].(string),
		args["keyId"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertKeyPairToPKCS12(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertKeyPairToPKCS12(
		args["privateKey"].(string),
		args["certificate"].(string),
		args["password"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPKCS12ToKeyPair(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPKCS12ToKeyPair(
		args["pkcs12"].(string),
		args["password"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return map[interface{}]interface{}{
		"privateKey":  result.PrivateKey,
		"publicKey":   result.PublicKey,
		"certificate": result.Certificate,
	}, nil
}

func (p *Plugin) convertPrivateKeyToPKCS8(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPrivateKeyToPKCS8(
		args["privateKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPrivateKeyToPKCS1(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPrivateKeyToPKCS1(
		args["privateKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPrivateKeyToJWK(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPrivateKeyToJWK(
		args["privateKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPrivateKeyToPublicKey(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPrivateKeyToPublicKey(
		args["privateKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPublicKeyToPKIX(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPublicKeyToPKIX(
		args["publicKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPublicKeyToPKCS1(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPublicKeyToPKCS1(
		args["publicKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) convertPublicKeyToJWK(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.ConvertPublicKeyToJWK(
		args["publicKey"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) decryptPrivateKey(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.DecryptPrivateKey(
		args["privateKeyEncrypted"].(string),
		args["password"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) encryptPrivateKey(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.EncryptPrivateKey(
		args["privateKey"].(string),
		args["password"].(string),
		args["cipherName"].(string),
	)
	if err != nil {
		return nil, plugin.NewError("error", err)
	}
	return result, nil
}

func (p *Plugin) decryptOAEP(arguments interface{}) (reply interface{}, err error) {
	args := arguments.(map[interface{}]interface{})

	result, err := p.instance.DecryptOAEP(
		args["message"].(string),
		args["label"].(string),
		args["hashName"].(string),
		args["privateKey"].(string),
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
		args["privateKey"].(string),
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
		args["publicKey"].(string),
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
		args["publicKey"].(string),
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
		args["saltLengthName"].(string),
		args["privateKey"].(string),
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
		args["privateKey"].(string),
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
		args["saltLengthName"].(string),
		args["publicKey"].(string),
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
		args["publicKey"].(string),
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
