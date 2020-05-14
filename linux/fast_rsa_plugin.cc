#include "fast_rsa_plugin.h"

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_glfw.h>
#include <flutter/standard_method_codec.h>
#include <sys/utsname.h>
#include "rsa.h"

#include <map>
#include <memory>
#include <sstream>
#include <iostream>
#include <string.h>
#include <stdio.h>
#include <inttypes.h>

namespace
{

using flutter::EncodableList;
using flutter::EncodableMap;
using flutter::EncodableValue;

const EncodableValue &ValueOrNull(const EncodableMap &map, const char *key)
{
  static EncodableValue null_value;
  auto it = map.find(EncodableValue(key));
  if (it == map.end())
  {
    return null_value;
  }
  return it->second;
}

char *WriteableChar(const std::string &str)
{
  char *writable = new char[str.size() + 1];
  std::copy(str.begin(), str.end(), writable);
  writable[str.size()] = '\0';
  return writable;
}

void convertJWKToPrivateKey(
    char *data,
    char *keyId,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertJWKToPrivateKey(
        data,
        keyId);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertJWKToPublicKey(
    char *data,
    char *keyId,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertJWKToPublicKey(
        data,
        keyId);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertKeyPairToPKCS12(
    char *privateKey,
    char *certificate,
    char *password,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertKeyPairToPKCS12(
        privateKey,
        certificate,
        password);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPKCS12ToKeyPair(
    char *pkcs12,
    char *password,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    PKCS12KeyPair output = ConvertPKCS12ToKeyPair(
        pkcs12,
        password);

    flutter::EncodableValue response(flutter::EncodableMap{
        {flutter::EncodableValue("privateKey"), flutter::EncodableValue(output.privateKey)},
        {flutter::EncodableValue("publicKey"), flutter::EncodableValue(output.publicKey)},
        {flutter::EncodableValue("certificate"), flutter::EncodableValue(output.certificate)}});

    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPrivateKeyToPKCS8(
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPrivateKeyToPKCS8(
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPrivateKeyToPKCS1(
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPrivateKeyToPKCS1(
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPrivateKeyToJWK(
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPrivateKeyToJWK(
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPrivateKeyToPublicKey(
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPrivateKeyToPublicKey(
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPublicKeyToPKIX(
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPublicKeyToPKIX(
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPublicKeyToPKCS1(
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPublicKeyToPKCS1(
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void convertPublicKeyToJWK(
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = ConvertPublicKeyToJWK(
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void decryptPrivateKey(
    char *privateKeyEncrypted,
    char *password,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = DecryptPrivateKey(
        privateKeyEncrypted,
        password);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void encryptPrivateKey(
    char *privateKey,
    char *password,
    char *cipherName,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = EncryptPrivateKey(
        privateKey,
        password,
        cipherName);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void decryptOAEP(
    char *message,
    char *label,
    char *hashName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = DecryptOAEP(
        message,
        label,
        hashName,
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void decryptOAEPBytes(
    const std::vector<uint8_t>& message,
    char *label,
    char *hashName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    DecryptOAEPBytes_return output = DecryptOAEPBytes(
        (void*)&message[0],
        message.size(),
        label,
        hashName,
        privateKey);
    
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void decryptPKCS1v15(
    char *message,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = DecryptPKCS1v15(
        message,
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void decryptPKCS1v15Bytes(
    const std::vector<uint8_t>& message,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    DecryptPKCS1v15Bytes_return output = DecryptPKCS1v15Bytes(
        (void*)&message[0],
        message.size(),
        privateKey);
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void encryptOAEP(
    char *message,
    char *label,
    char *hashName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = EncryptOAEP(
        message,
        label,
        hashName,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}


void encryptOAEPBytes(
    const std::vector<uint8_t>& message,
    char *label,
    char *hashName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    EncryptOAEPBytes_return output = EncryptOAEPBytes(
        (void*)&message[0],
        message.size(),
        label,
        hashName,
        publicKey);
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void encryptPKCS1v15(
    char *message,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = EncryptPKCS1v15(
        message,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void encryptPKCS1v15Bytes(
    const std::vector<uint8_t>& message,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    EncryptPKCS1v15Bytes_return output = EncryptPKCS1v15Bytes(
        (void*)&message[0],
        message.size(),
        publicKey);
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void signPSS(
    char *message,
    char *hashName,
    char *saltLengthName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = SignPSS(
        message,
        hashName,
        saltLengthName,
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void signPSSBytes(
    const std::vector<uint8_t>& message,
    char *hashName,
    char *saltLengthName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    SignPSSBytes_return output = SignPSSBytes(
        (void*)&message[0],
        message.size(),
        hashName,
        saltLengthName,
        privateKey);
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void signPKCS1v15(
    char *message,
    char *hashName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = SignPKCS1v15(
        message,
        hashName,
        privateKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void signPKCS1v15Bytes(
    const std::vector<uint8_t>& message,
    char *hashName,
    char *privateKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    SignPKCS1v15Bytes_return output = SignPKCS1v15Bytes(
        (void*)&message[0],
        message.size(),
        hashName,
        privateKey);
    if (output.r0 == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }

    const uint8_t *charBuffer = (uint8_t *) output.r0;
    std::vector<uint8_t> vectorBuffer(charBuffer, charBuffer + output.r1);

    flutter::EncodableValue response(vectorBuffer);

    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void verifyPSS(
    char *signature,
    char *message,
    char *hashName,
    char *saltLengthName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPSS(
        signature,
        message,
        hashName,
        saltLengthName,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(strcmp(output, "1") == 0);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void verifyPSSBytes(
    const std::vector<uint8_t>& signature,
    const std::vector<uint8_t>& message,
    char *hashName,
    char *saltLengthName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPSSBytes(
        (void*)&signature[0],
        signature.size(),
        (void*)&message[0],
        message.size(),
        hashName,
        saltLengthName,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(strcmp(output, "1") == 0);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void verifyPKCS1v15(
    char *signature,
    char *message,
    char *hashName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPKCS1v15(
        signature,
        message,
        hashName,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(strcmp(output, "1") == 0);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void verifyPKCS1v15Bytes(
    const std::vector<uint8_t>& signature,
    const std::vector<uint8_t>& message,
    char *hashName,
    char *publicKey,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPKCS1v15Bytes(
        (void*)&signature[0],
        signature.size(),
        (void*)&message[0],
        message.size(),
        hashName,
        publicKey);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(strcmp(output, "1") == 0);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void hash(
    char *message,
    char *name,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = Hash(
        message,
        name);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void base64(
    char *message,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = Base64(
        message);
    if (output == NULL)
    {
      result->Error("error", "null pointer");
      return;
    }
    flutter::EncodableValue response(output);
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

void generate(
    int64_t bits,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    GoInt goBits = bits;
    KeyPair output = Generate(goBits);
    // printf("privateKey: %s\n", output.privateKey);
    // printf("publicKey: %s\n", output.publicKey);

    flutter::EncodableValue response(flutter::EncodableMap{
        {flutter::EncodableValue("privateKey"), flutter::EncodableValue(output.privateKey)},
        {flutter::EncodableValue("publicKey"), flutter::EncodableValue(output.publicKey)}});

    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

class FastRsaPlugin : public flutter::Plugin
{
public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarGlfw *registrar);

  FastRsaPlugin();

  virtual ~FastRsaPlugin();

private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

// static
void FastRsaPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarGlfw *registrar)
{
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "rsa",
          &flutter::StandardMethodCodec::GetInstance());
  auto plugin = std::make_unique<FastRsaPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

FastRsaPlugin::FastRsaPlugin() {}

FastRsaPlugin::~FastRsaPlugin() {}

void FastRsaPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{
  if (method_call.method_name().compare("convertJWKToPrivateKey") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertJWKToPrivateKey(
        WriteableChar(ValueOrNull(args, "data").StringValue()),
        WriteableChar(ValueOrNull(args, "keyId").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertJWKToPublicKey") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertJWKToPublicKey(
        WriteableChar(ValueOrNull(args, "data").StringValue()),
        WriteableChar(ValueOrNull(args, "keyId").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertKeyPairToPKCS12") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertKeyPairToPKCS12(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        WriteableChar(ValueOrNull(args, "certificate").StringValue()),
        WriteableChar(ValueOrNull(args, "password").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPKCS12ToKeyPair") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPKCS12ToKeyPair(
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "password").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPrivateKeyToPKCS8") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPrivateKeyToPKCS8(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPrivateKeyToPKCS1") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPrivateKeyToPKCS1(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPrivateKeyToJWK") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPrivateKeyToJWK(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPrivateKeyToPublicKey") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPrivateKeyToPublicKey(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPublicKeyToPKIX") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPublicKeyToPKIX(
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPublicKeyToPKCS1") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPublicKeyToPKCS1(
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("convertPublicKeyToJWK") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    convertPublicKeyToJWK(
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptPrivateKey") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptPrivateKey(
        WriteableChar(ValueOrNull(args, "privateKeyEncrypted").StringValue()),
        WriteableChar(ValueOrNull(args, "password").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptPrivateKey") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptPrivateKey(
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        WriteableChar(ValueOrNull(args, "password").StringValue()),
        WriteableChar(ValueOrNull(args, "cipherName").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptOAEP") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptOAEP(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptOAEPBytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptOAEPBytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptPKCS1v15Bytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptPKCS1v15Bytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptOAEP") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptOAEP(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptOAEPBytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptOAEPBytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptPKCS1v15Bytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptPKCS1v15Bytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPSS") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPSS(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "saltLengthName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPSSBytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPSSBytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "saltLengthName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPKCS1v15Bytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPKCS1v15Bytes(
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "privateKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPSS") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPSS(
        WriteableChar(ValueOrNull(args, "signature").StringValue()),
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "saltLengthName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPSSBytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPSSBytes(
        ValueOrNull(args, "signature").ByteListValue(),
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "saltLengthName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPKCS1v15(
        WriteableChar(ValueOrNull(args, "signature").StringValue()),
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPKCS1v15Bytes") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPKCS1v15Bytes(
        ValueOrNull(args, "signature").ByteListValue(),
        ValueOrNull(args, "message").ByteListValue(),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "publicKey").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("hash") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    hash(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "name").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("base64") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    base64(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("generate") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    generate(
        ValueOrNull(args, "bits").LongValue(),
        move(result));
  }
  else
  {
    result->NotImplemented();
  }
}

} // namespace

void FastRsaPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar)
{
  static auto *plugin_registrars =
      new std::map<FlutterDesktopPluginRegistrarRef,
                   std::unique_ptr<flutter::PluginRegistrarGlfw>>;
  auto insert_result = plugin_registrars->emplace(
      registrar, std::make_unique<flutter::PluginRegistrarGlfw>(registrar));

  FastRsaPlugin::RegisterWithRegistrar(insert_result.first->second.get());
}
