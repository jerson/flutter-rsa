package dev.jerson.rsa;

import androidx.annotation.NonNull;

import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import rsa.FastRSA;
import rsa.KeyPair;
import rsa.Rsa;

/**
 * RsaPlugin
 */
public class RsaPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private FastRSA instance;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        instance = Rsa.newFastRSA();
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "rsa");
        channel.setMethodCallHandler(this);
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "rsa");
        channel.setMethodCallHandler(new RsaPlugin());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        switch (call.method) {
            case "decryptOAEP":
                decryptOAEP(
                        (String) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "decryptPKCS1v15":
                decryptPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "encryptOAEP":
                encryptOAEP(
                        (String) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "encryptPKCS1v15":
                encryptPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "signPSS":
                signPSS(
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
            case "signPKCS1v15":
                signPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "verifyPSS":
                verifyPSS(
                        (String) call.argument("signature"),
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "verifyPKCS1v15":
                verifyPKCS1v15(
                        (String) call.argument("signature"),
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("pkcs12"),
                        (String) call.argument("passphrase"),
                        result
                );
                break;
            case "hash":
                hash(
                        (String) call.argument("message"),
                        (String) call.argument("name"),
                        result
                );
                break;
            case "base64":
                base64(
                        (String) call.argument("message"),
                        result
                );
                break;
            case "generate":
                generate(
                        (Integer) call.argument("bits"),
                        result
                );
                break;
            default:
                result.notImplemented();
                break;
        }
    }


    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    private void decryptOAEP(String message, String label, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.decryptOAEP(message, label, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void decryptPKCS1v15(String message, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.decryptPKCS1v15(message, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void encryptOAEP(String message, String label, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.encryptOAEP(message, label, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void encryptPKCS1v15(String message, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.encryptPKCS1v15(message, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void signPSS(String message, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.signPSS(message, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void signPKCS1v15(String message, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            String result = instance.signPKCS1v15(message, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void verifyPSS(String signature, String message, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            Boolean result = instance.verifyPSS(signature, message, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void verifyPKCS1v15(String signature, String message, String hashName, String pkcs12, String passphrase, Result promise) {
        try {
            Boolean result = instance.verifyPKCS1v15(signature, message, hashName, pkcs12, passphrase);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void hash(String message, String name, Result promise) {
        try {
            String result = instance.hash(message, name);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void base64(String message, Result promise) {
        try {
            String result = instance.base64(message);
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }


    private void generate(Integer bits, Result promise) {
        try {
            KeyPair keyPair = instance.generate(bits);
            HashMap<String, Object> result = new HashMap<>();
            result.put("publicKey", keyPair.getPublicKey());
            result.put("privateKey", keyPair.getPrivateKey());
            promise.success(result);
        } catch (Exception e) {
            promise.error("error", e.getMessage(), e);
        }
    }
}
