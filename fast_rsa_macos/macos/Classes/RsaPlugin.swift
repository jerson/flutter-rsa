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
        case "encryptPKCS1v15":
            encryptPKCS1v15(
                    message: args["message"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "encryptOAEP":
            encryptOAEP(
                    message: args["message"] as? String,
                    label: args["label"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "decryptOAEP":
            decryptOAEP(
                    message: args["message"] as? String,
                    label: args["label"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "decryptPKCS1v15":
            decryptPKCS1v15(
                    message: args["message"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "signPKCS1v15":
            signPKCS1v15(
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "signPSS":
            signPSS(
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "verifyPKCS1v15":
            verifyPKCS1v15(
                    signature: args["signature"] as? String,
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
                    result: result
            )
        case "verifyPSS":
            verifyPSS(
                    signature: args["signature"] as? String,
                    message: args["message"] as? String,
                    hashName: args["hashName"] as? String,
                    pkcs12: args["pkcs12"] as? String,
                    passphrase: args["passphrase"] as? String,
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

    func encryptPKCS1v15(message: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.encryptPKCS1v15(message, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func encryptOAEP(message: String?, label: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.encryptOAEP(message, label: label, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func decryptOAEP(message: String?, label: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.decryptOAEP(message, label: label, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func decryptPKCS1v15(message: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.decryptPKCS1v15(message, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func signPKCS1v15(message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.signPKCS1v15(message, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func signPSS(message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var error: NSError?
                let output = try self.instance?.signPSS(message, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, error: &error)

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

    func verifyPKCS1v15(signature: String?, message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {
                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPKCS1v15(signature, message: message, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, ret0_: &ret0_)

                self.result(result, output: ret0_.boolValue as NSNumber)
            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }

    func verifyPSS(signature: String?, message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: @escaping FlutterResult) {
        queue?.async(execute: {
            do {

                var ret0_: ObjCBool = false
                _ = try self.instance?.verifyPSS(signature, message: message, hashName: hashName, pkcs12: pkcs12, passphrase: passphrase, ret0_: &ret0_)

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
                    "publicKey": output?.publicKey,
                    "privateKey": output?.privateKey,
                ])

            } catch {
                self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))
            }
        })
    }
}
