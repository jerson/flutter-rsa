package dev.jerson.rsa;

import android.os.Handler;
import android.os.Looper;

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
    private Handler handler;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        instance = Rsa.newFastRSA();
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "rsa");
        channel.setMethodCallHandler(this);
        handler = new Handler(Looper.getMainLooper());
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

    private void success(final Result promise, final Object result) {
        Runnable local = new Runnable() {
            @Override
            public void run() {
                promise.success(result);
            }
        };

        handler.post(local);
    }

    private void error(final Result promise, final String errorCode, final String errorMessage, final Object errorDetails) {
        Runnable local = new Runnable() {
            @Override
            public void run() {
                promise.error(errorCode, errorMessage, errorDetails);
            }
        };

        handler.post(local);
    }

    private void decryptOAEP(final String message, final String label, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.decryptOAEP(message, label, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void decryptPKCS1v15(final String message, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.decryptPKCS1v15(message, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void encryptOAEP(final String message, final String label, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.encryptOAEP(message, label, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void encryptPKCS1v15(final String message, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.encryptPKCS1v15(message, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void signPSS(final String message, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.signPSS(message, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void signPKCS1v15(final String message, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.signPKCS1v15(message, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void verifyPSS(final String signature, final String message, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPSS(signature, message, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void verifyPKCS1v15(final String signature, final String message, final String hashName, final String pkcs12, final String passphrase, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPKCS1v15(signature, message, hashName, pkcs12, passphrase);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void hash(final String message, final String name, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.hash(message, name);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void base64(final String message, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.base64(message);
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }


    private void generate(final Integer bits, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    KeyPair keyPair = instance.generate(bits);
                    HashMap<String, Object> result = new HashMap<>();
                    result.put("publicKey", keyPair.getPublicKey());
                    result.put("privateKey", keyPair.getPrivateKey());
                    success(promise,result);
                } catch (Exception e) {
                    error(promise,"error", e.getMessage(), e);
                }
            }
        }).start();
    }
}
