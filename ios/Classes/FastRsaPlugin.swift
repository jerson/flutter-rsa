import Flutter
import UIKit
import RSABridge

public class FastRsaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fast_rsa", binaryMessenger: registrar.messenger())
    let instance = FastRsaPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "init":
        _ = RSABridge.RSAEncodeText(nil, nil)
        _ = RSABridge.RSABridgeCall(nil, nil, 0)
        _ = RSABridge.RSADecodeText(nil, 0, nil, 0, 0, 0)
      result("success")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

