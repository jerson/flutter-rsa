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

   func result(_ result: FlutterResult, output: Any?) {
         DispatchQueue.main.async(execute: {
             result(output)
         })
   }
    
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    
    let args = call.arguments as! [String: Any]
    
    switch call.method {
        case "getPlatformVersion":
          result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        case "encryptOAEP":
        
         encryptOAEP(
            message: args["message"] as? String,
            label: args["message"] as? String,
            hashName: args["message"] as? String,
            pkcs12: args["message"] as? String,
            passphrase: args["message"] as? String,
            result: result
         )
           
          /*let outputBytes = EncryptOAEP(
                           UnsafeMutablePointer<Int8>(mutating: args["message"] as! String),
                           UnsafeMutablePointer<Int8>(mutating: args["label"] as! String),
                           UnsafeMutablePointer<Int8>(mutating: args["hashName"] as! String),
                           UnsafeMutablePointer<Int8>(mutating: args["pkcs12"] as! String),
                           UnsafeMutablePointer<Int8>(mutating: args["passphrase"] as! String)
                       );
          result(String(cString: outputBytes!))
          */
          /*do {
              let outputBytes = try EncryptOAEP(
                  UnsafeMutablePointer<Int8>(mutating: args["message"] as! String),
                  UnsafeMutablePointer<Int8>(mutating: args["label"] as! String),
                  UnsafeMutablePointer<Int8>(mutating: args["hashName"] as! String),
                  UnsafeMutablePointer<Int8>(mutating: args["pkcs12"] as! String),
                  UnsafeMutablePointer<Int8>(mutating: args["passphrase"] as! String)
              );
                
              //let output =  String(bytesNoCopy: outputBytes!, length: strlen(outputBytes!), encoding: .utf8, freeWhenDone: true)
              //result(output)
              result(String(cString: outputBytes!))
          } catch {
            result(FlutterError.init(code: "error", message: error.localizedDescription, details: nil))
          }*/
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
      func encryptPKCS1v15(message: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
        queue?.async(execute: {
               
               do{
                    var error: NSErrorPointer?
                   let output =  self.instance?.encryptPKCS1v15(message, pkcs12: pkcs12, passphrase: passphrase, error: &error )

                                 if error != nil {
                                   self.result(result, output: FlutterError(code: String(format: "%ld", error?.pointee?.code ?? 0), message: error?.pointee?.description, details: nil))
                                 } else {
                                     self.result(result, output: output)
                                 }
               }catch {
                   self.result(result, output: FlutterError(code: "error", message: error.localizedDescription, details: nil))

               }
              
              })
      }

      func encryptOAEP(message: String?, label: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func decryptOAEP(message: String?, label: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func decryptPKCS1v15(message: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func signPKCS1v15(message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func signPSS(message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func verifyPKCS1v15(signature: String?, message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func verifyPSS(signature: String?, message: String?, hashName: String?, pkcs12: String?, passphrase: String?, result: FlutterResult) {
      }

      func hash(message: String?, name: String?, result: FlutterResult) {
      }

      func base64(message: String?, result: FlutterResult) {
      }

      func generate(bits: NSNumber?, result: FlutterResult) {
      }
}
