import Cocoa
import FlutterMacOS

public class RsaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "rsa", binaryMessenger: registrar.messenger)
    let instance = RsaPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   
    switch call.method {
        case "getPlatformVersion":
          result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        case "encryptOAEP":
        
            let arguments = call.arguments as! NSDictionary
           let output = EncryptOAEP(
            arguments.value(forKey: "message") as? UnsafeMutablePointer<Int8> ,
            arguments.value(forKey: "label") as? UnsafeMutablePointer<Int8> ,
            arguments.value(forKey: "hashName") as? UnsafeMutablePointer<Int8> ,
            arguments.value(forKey: "pkcs12") as? UnsafeMutablePointer<Int8> ,
            arguments.value(forKey: "passphrase") as? UnsafeMutablePointer<Int8>
            );
            result(output)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
/*  private func encryptOAEP(){
    EncryptOAEP();
  }*/
}
