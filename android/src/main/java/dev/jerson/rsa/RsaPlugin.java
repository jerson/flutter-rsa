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
import rsa.PKCS12KeyPair;
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

    private static RsaPlugin pluginFactory() {
        RsaPlugin plugin = new RsaPlugin();
        plugin.initialize();
        return plugin;
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
        channel.setMethodCallHandler(pluginFactory());
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        initialize();
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "rsa");
        channel.setMethodCallHandler(this);
    }

    private void initialize() {
        instance = Rsa.newFastRSA();
        handler = new Handler(Looper.getMainLooper());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

        switch (call.method) {
            case "convertJWKToPrivateKey":
                convertJWKToPrivateKey(
                        (String) call.argument("data"),
                        (String) call.argument("keyId"),
                        result
                );
                break;
            case "convertJWKToPublicKey":
                convertJWKToPublicKey(
                        (String) call.argument("data"),
                        (String) call.argument("keyId"),
                        result
                );
                break;
            case "convertKeyPairToPKCS12":
                convertKeyPairToPKCS12(
                        (String) call.argument("privateKey"),
                        (String) call.argument("certificate"),
                        (String) call.argument("password"),
                        result
                );
                break;
            case "convertPKCS12ToKeyPair":
                convertPKCS12ToKeyPair(
                        (String) call.argument("pkcs12"),
                        (String) call.argument("password"),
                        result
                );
                break;
            case "convertPrivateKeyToPKCS8":
                convertPrivateKeyToPKCS8(
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "convertPrivateKeyToPKCS1":
                convertPrivateKeyToPKCS1(
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "convertPrivateKeyToJWK":
                convertPrivateKeyToJWK(
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "convertPrivateKeyToPublicKey":
                convertPrivateKeyToPublicKey(
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "convertPublicKeyToPKIX":
                convertPublicKeyToPKIX(
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "convertPublicKeyToPKCS1":
                convertPublicKeyToPKCS1(
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "convertPublicKeyToJWK":
                convertPublicKeyToJWK(
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "decryptPrivateKey":
                decryptPrivateKey(
                        (String) call.argument("privateKeyEncrypted"),
                        (String) call.argument("password"),
                        result
                );
                break;
            case "encryptPrivateKey":
                encryptPrivateKey(
                        (String) call.argument("privateKey"),
                        (String) call.argument("password"),
                        (String) call.argument("cipherName"),
                        result
                );
                break;
            case "decryptOAEP":
                decryptOAEP(
                        (String) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "decryptOAEPBytes":
                decryptOAEPBytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "decryptPKCS1v15":
                decryptPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "decryptPKCS1v15Bytes":
                decryptPKCS1v15Bytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "encryptOAEP":
                encryptOAEP(
                        (String) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "encryptOAEPBytes":
                encryptOAEPBytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("label"),
                        (String) call.argument("hashName"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "encryptPKCS1v15":
                encryptPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "encryptPKCS1v15Bytes":
                encryptPKCS1v15Bytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "signPSS":
                signPSS(
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("saltLengthName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "signPSSBytes":
                signPSSBytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("saltLengthName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "signPKCS1v15":
                signPKCS1v15(
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "signPKCS1v15Bytes":
                signPKCS1v15Bytes(
                        (byte[]) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("privateKey"),
                        result
                );
                break;
            case "verifyPSS":
                verifyPSS(
                        (String) call.argument("signature"),
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("saltLengthName"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "verifyPSSBytes":
                verifyPSSBytes(
                        (byte[]) call.argument("signature"),
                        (byte[]) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("saltLengthName"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "verifyPKCS1v15":
                verifyPKCS1v15(
                        (String) call.argument("signature"),
                        (String) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("publicKey"),
                        result
                );
                break;
            case "verifyPKCS1v15Bytes":
                verifyPKCS1v15Bytes(
                        (byte[]) call.argument("signature"),
                        (byte[]) call.argument("message"),
                        (String) call.argument("hashName"),
                        (String) call.argument("publicKey"),
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

    private void convertJWKToPrivateKey(final String data, final String keyId, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertJWKToPrivateKey(data, keyId);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertJWKToPublicKey(final String data, final String keyId, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertJWKToPublicKey(data, keyId);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertKeyPairToPKCS12(final String privateKey, final String certificate, final String password, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertKeyPairToPKCS12(privateKey, certificate, password);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPKCS12ToKeyPair(final String pkcs12, final String password, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    PKCS12KeyPair keyPair = instance.convertPKCS12ToKeyPair(pkcs12, password);
                    HashMap<String, Object> result = new HashMap<>();
                    result.put("privateKey", keyPair.getPrivateKey());
                    result.put("publicKey", keyPair.getPublicKey());
                    result.put("certificate", keyPair.getCertificate());
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPrivateKeyToPKCS8(final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPrivateKeyToPKCS8(privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPrivateKeyToPKCS1(final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPrivateKeyToPKCS1(privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPrivateKeyToJWK(final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPrivateKeyToJWK(privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPrivateKeyToPublicKey(final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPrivateKeyToPublicKey(privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPublicKeyToPKIX(final String publicKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPublicKeyToPKIX(publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPublicKeyToPKCS1(final String publicKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPublicKeyToPKCS1(publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void convertPublicKeyToJWK(final String publicKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.convertPublicKeyToPKCS1(publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void decryptPrivateKey(final String privateKeyEncrypted, final String password, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.decryptPrivateKey(privateKeyEncrypted, password);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void encryptPrivateKey(final String privateKey, final String password, final String cipherName, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.encryptPrivateKey(privateKey, password, cipherName);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void decryptOAEP(final String message, final String label, final String hashName, final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.decryptOAEP(message, label, hashName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }

    private void decryptOAEPBytes(final byte[] message, final String label, final String hashName, final String privateKey, final Result promise) {

        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.decryptOAEPBytes(message, label, hashName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();

    }


    private void decryptPKCS1v15(final String message, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.decryptPKCS1v15(message, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void decryptPKCS1v15Bytes(final byte[] message, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.decryptPKCS1v15Bytes(message, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void encryptOAEP(final String message, final String label, final String hashName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.encryptOAEP(message, label, hashName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void encryptOAEPBytes(final byte[] message, final String label, final String hashName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.encryptOAEPBytes(message, label, hashName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void encryptPKCS1v15(final String message, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.encryptPKCS1v15(message, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void encryptPKCS1v15Bytes(final byte[] message, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.encryptPKCS1v15Bytes(message, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void signPSS(final String message, final String hashName, final String saltLengthName, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.signPSS(message, hashName, saltLengthName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void signPSSBytes(final byte[] message, final String hashName, final String saltLengthName, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.signPSSBytes(message, hashName, saltLengthName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void signPKCS1v15(final String message, final String hashName, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.signPKCS1v15(message, hashName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void signPKCS1v15Bytes(final byte[] message, final String hashName, final String privateKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    byte[] result = instance.signPKCS1v15Bytes(message, hashName, privateKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void verifyPSS(final String signature, final String message, final String hashName, final String saltLengthName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPSS(signature, message, hashName, saltLengthName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void verifyPSSBytes(final byte[] signature, final byte[] message, final String hashName, final String saltLengthName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPSSBytes(signature, message, hashName, saltLengthName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void verifyPKCS1v15(final String signature, final String message, final String hashName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPKCS1v15(signature, message, hashName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void verifyPKCS1v15Bytes(final byte[] signature, final byte[] message, final String hashName, final String publicKey, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    Boolean result = instance.verifyPKCS1v15Bytes(signature, message, hashName, publicKey);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void hash(final String message, final String name, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.hash(message, name);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }


    private void base64(final String message, final Result promise) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    String result = instance.base64(message);
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
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
                    result.put("privateKey", keyPair.getPrivateKey());
                    result.put("publicKey", keyPair.getPublicKey());
                    success(promise, result);
                } catch (Exception e) {
                    error(promise, "error", e.getMessage(), null);
                }
            }
        }).start();
    }
}
