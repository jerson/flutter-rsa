import Cocoa
import FlutterMacOS
import Rsa

public class RsaPlugin: NSObject, FlutterPlugin {

    private var queue: DispatchQueue?
    private var instance: RsaFastRSA?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "rsa", binaryMessenger: registrar.messenger)
        let instance = RsaPlugin()
        instance.setup()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    func setup() {
        queue = DispatchQueue(label: "fast-rsa")
        instance = RsaNewFastRSA()
    }

    func result(_ result: @escaping FlutterResult, output: Any?) {
        DispatchQueue.main.async(execute: {
            result(output)
        })
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        let args = call.arguments as! [String: Any]

        switch call.method {
        case "convertJWKToPrivateKey":
            convertJWKToPrivateKey(
                    data: args["data"] as? String,
                    keyId: args["keyId"] as? String,
                    result: result
            )
        case "convertJWKToPublicKey":
            convertJWKToPublicKey(
                    data: args["data"] as? String,
                    keyId: args["keyId"] as? String,
                    result: result
            )
        case "convertKeyPairToPKCS12":
            convertKeyPairToPKCS12(
                    privateKey: args["privateKey"] as? String,
                    certificate: args["certificate"] as? String,
                    password: args["password"] as? String,
                    result: result
            )
        case "convertPKCS12ToKeyPair":
            convertPKCS12ToKeyPair(
                    pkcs12: args["pkcs12"] as? String,
                    password: args["password"] as? String,
                    result: result
            )
        case "convertPrivateKeyToPKCS8":
            convertPrivateKeyToPKCS8(
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "convertPrivateKeyToPKCS1":
            convertPrivateKeyToPKCS1(
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "convertPrivateKeyToJWK":
            convertPrivateKeyToJWK(
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "convertPrivateKeyToPublicKey":
            convertPrivateKeyToPublicKey(
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "convertPublicKeyToPKIX":
            convertPublicKeyToPKIX(
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "convertPublicKeyToPKCS1":
            convertPublicKeyToPKCS1(
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "convertPublicKeyToJWK":
            convertPublicKeyToJWK(
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "decryptPrivateKey":
            decryptPrivateKey(
                    privateKeyEncrypted: args["privateKeyEncrypted"] as? String,
                    password: args["password"] as? String,
                    result: result
            )
        case "encryptPrivateKey":
            encryptPrivateKey(
                    privateKey: args["privateKey"] as? String,
                    password: args["password"] as? String,
                    cipherName: args["cipherName"] as? String,
                    result: result
            )
        case "encryptPKCS1v15":
            encryptPKCS1v15(
                    message: args["message"] as? String,
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "encryptPKCS1v15Bytes":
            encryptPKCS1v15Bytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        publicKey: args["publicKey"] as? String,
                        result: result
            )
        case "encryptOAEP":
            encryptOAEP(
                    message: args["message"] as? String,
                    label: args["label"] as? String,
                    hashName: args["hashName"] as? String,
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "encryptOAEPBytes":
            encryptOAEPBytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        label: args["label"] as? String,
                        hashName: args["hashName"] as? String,
                        publicKey: args["publicKey"] as? String,
                        result: result
            )
        case "decryptOAEP":
            decryptOAEP(
                    message: args["message"] as? String,
                    label: args["label"] as? String,
                    hashName: args["hashName"] as? String,
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "decryptOAEPBytes":
            decryptOAEPBytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        label: args["label"] as? String,
                        hashName: args["hashName"] as? String,
                        privateKey: args["privateKey"] as? String,
                        result: result
            )
        case "decryptPKCS1v15":
            decryptPKCS1v15(
                    message: args["message"] as? String,
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "decryptPKCS1v15Bytes":
            decryptPKCS1v15Bytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        privateKey: args["privateKey"] as? String,
                        result: result
            )
        case "signPKCS1v15":
            signPKCS1v15(
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "signPKCS1v15Bytes":
            signPKCS1v15Bytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        hashName: args["hashName"] as? String,
                        privateKey: args["privateKey"] as? String,
                        result: result
                )
        case "signPSS":
            signPSS(
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    saltLengthName: args["saltLengthName"] as? String,
                    privateKey: args["privateKey"] as? String,
                    result: result
            )
        case "signPSSBytes":
            signPSSBytes(
                        message: args["message"] as? FlutterStandardTypedData,
                        hashName: args["hashName"] as? String,
                        saltLengthName: args["saltLengthName"] as? String,
                        privateKey: args["privateKey"] as? String,
                        result: result
                )
        case "verifyPKCS1v15":
            verifyPKCS1v15(
                    signature: args["signature"] as? String,
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "verifyPKCS1v15Bytes":
            verifyPKCS1v15Bytes(
                        signature: args["signature"] as? FlutterStandardTypedData,
                        message: args["message"] as? FlutterStandardTypedData,
                        hashName: args["hashName"] as? String,
                        publicKey: args["publicKey"] as? String,
                        result: result
                )
        case "verifyPSS":
            verifyPSS(
                    signature: args["signature"] as? String,
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    saltLengthName: args["saltLengthName"] as? String,
                    publicKey: args["publicKey"] as? String,
                    result: result
            )
        case "verifyPSSBytes":
            verifyPSSBytes(
                        signature: args["signature"] as? FlutterStandardTypedData,
                        message: args["message"] as? FlutterStandardTypedData,
                        hashName: args["hashName"] as? String,
                        saltLengthName: args["saltLengthName"] as? String,
                        publicKey: args["publicKey"] as? String,
                        result: result
                )
        case "base64":
            base64(
                    message: args["message"] as? String,
                    result: result
            )
        case "hash":
            hash(
                    message: args["message"] as? String,
                    name: args["name"] as? String,
                    result: result
            )
        case "generate":
            generate(
                    bits: args["bits"] as? Int,
                    result: result
            )
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    func convertJWKToPrivateKey(data: String?, keyId: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertJWK(toPrivateKey:data, keyID: keyId, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertJWKToPublicKey(data: String?, keyId: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertJWK(toPublicKey:data, keyID: keyId, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertKeyPairToPKCS12(privateKey: String?, certificate: String?, password: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertKeyPair(toPKCS12:privateKey, certificate: certificate, password: password, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPKCS12ToKeyPair(pkcs12: String?, password: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.convertPKCS12(toKeyPair:pkcs12, password: password)

                self.result(result, output: [
                        "privateKey": output?.privateKey,
                        "publicKey": output?.publicKey,
                        "certificate": output?.certificate,
                ])
                
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPrivateKeyToPKCS8(privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPrivateKey(toPKCS8:privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPrivateKeyToPKCS1(privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPrivateKey(toPKCS1:privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPrivateKeyToJWK(privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPrivateKey(toJWK:privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPrivateKeyToPublicKey(privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPrivateKey(toPublicKey:privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPublicKeyToPKIX(publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPublicKey(toPKIX:publicKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPublicKeyToPKCS1(publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPublicKey(toPKCS1:publicKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func convertPublicKeyToJWK(publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.convertPublicKey(toJWK:publicKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func decryptPrivateKey(privateKeyEncrypted: String?, password: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.decryptPrivateKey(privateKeyEncrypted, password: password,  error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func encryptPrivateKey(privateKey: String?, password: String?, cipherName: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.encryptPrivateKey(privateKey, password: password, cipherName: cipherName, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }


    func encryptPKCS1v15(message: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.encryptPKCS1v15(message, publicKey: publicKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }


    func encryptPKCS1v15Bytes(message: FlutterStandardTypedData?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.encryptPKCS1v15Bytes(message?.data, publicKey: publicKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func encryptOAEP(message: String?, label: String?, hashName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.encryptOAEP(message, label: label, hashName: hashName, publicKey: publicKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func encryptOAEPBytes(message: FlutterStandardTypedData?, label: String?, hashName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.encryptOAEPBytes(message?.data, label: label, hashName: hashName, publicKey: publicKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func decryptOAEP(message: String?, label: String?, hashName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.decryptOAEP(message, label: label, hashName: hashName, privateKey: privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }
    
    func decryptOAEPBytes(message: FlutterStandardTypedData?, label: String?, hashName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.decryptOAEPBytes(message?.data, label: label, hashName: hashName, privateKey: privateKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }
    
    func decryptPKCS1v15(message: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.decryptPKCS1v15(message, privateKey: privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }
    
    func decryptPKCS1v15Bytes(message: FlutterStandardTypedData?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.decryptPKCS1v15Bytes(message?.data, privateKey: privateKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func signPKCS1v15(message: String?, hashName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.signPKCS1v15(message, hashName: hashName, privateKey: privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func signPKCS1v15Bytes(message: FlutterStandardTypedData?, hashName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.signPKCS1v15Bytes(message?.data, hashName: hashName, privateKey: privateKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func signPSS(message: String?, hashName: String?, saltLengthName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.signPSS(message, hashName: hashName, saltLengthName: saltLengthName, privateKey: privateKey, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func signPSSBytes(message: FlutterStandardTypedData?, hashName: String?, saltLengthName: String?, privateKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.signPSSBytes(message?.data, hashName: hashName, saltLengthName: saltLengthName, privateKey: privateKey)
                self.result(result, output: output)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func verifyPKCS1v15(signature: String?, message: String?, hashName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPKCS1v15(signature, message: message, hashName: hashName, publicKey: publicKey, ret0_: &ret0_)

                self.result(result, output: ret0_.boolValue as NSNumber)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func verifyPKCS1v15Bytes(signature: FlutterStandardTypedData?, message: FlutterStandardTypedData?, hashName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPKCS1v15Bytes(signature?.data, message: message?.data, hashName: hashName, publicKey: publicKey, ret0_: &ret0_)

                self.result(result, output: ret0_.boolValue as NSNumber)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func verifyPSS(signature: String?, message: String?, hashName: String?, saltLengthName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {

                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPSS(signature, message: message, hashName: hashName, saltLengthName: saltLengthName, publicKey: publicKey, ret0_: &ret0_)

                self.result(result, output: ret0_.boolValue as NSNumber)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func verifyPSSBytes(signature: FlutterStandardTypedData?, message: FlutterStandardTypedData?, hashName: String?, saltLengthName: String?, publicKey: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {

                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPSSBytes(signature?.data, message: message?.data, hashName: hashName, saltLengthName: saltLengthName, publicKey: publicKey, ret0_: &ret0_)

                self.result(result, output: ret0_.boolValue as NSNumber)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func hash(message: String?, name: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.hash(message, name: name, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func base64(message: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.base64(message, error: &error)

                if error != nil {
                    self.result(result, output: FlutterError(code: String(format: "%ld", error?.code ?? 0), message: error?.description, details: nil))
                } else {
                    self.result(result, output: output)
                }
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func generate(bits: Int?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                let output = try self.instance?.generate(bits!)

                self.result(result, output: [
                    "privateKey": output?.privateKey,
                    "publicKey": output?.publicKey,
                ])

            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }
}
