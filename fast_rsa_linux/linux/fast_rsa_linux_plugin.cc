#include "fast_rsa_linux_plugin.h"

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

void decryptOAEP(
    char *message,
    char *label,
    char *hashName,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = DecryptOAEP(
        message,
        label,
        hashName,
        pkcs12,
        passphrase);
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

void decryptPKCS1v15(
    char *message,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = DecryptPKCS1v15(
        message,
        pkcs12,
        passphrase);
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

void encryptOAEP(
    char *message,
    char *label,
    char *hashName,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = EncryptOAEP(
        message,
        label,
        hashName,
        pkcs12,
        passphrase);
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

void encryptPKCS1v15(
    char *message,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = EncryptPKCS1v15(
        message,
        pkcs12,
        passphrase);
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

void signPSS(
    char *message,
    char *hashName,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = SignPSS(
        message,
        hashName,
        pkcs12,
        passphrase);
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

void signPKCS1v15(
    char *message,
    char *hashName,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = SignPKCS1v15(
        message,
        hashName,
        pkcs12,
        passphrase);
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

void verifyPSS(
    char *signature,
    char *message,
    char *hashName,
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPSS(
        signature,
        message,
        hashName,
        pkcs12,
        passphrase);
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
    char *pkcs12,
    char *passphrase,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{

  try
  {
    char *output = VerifyPKCS1v15(
        signature,
        message,
        hashName,
        pkcs12,
        passphrase);
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
       {flutter::EncodableValue("publicKey"), flutter::EncodableValue(output.publicKey)},
       {flutter::EncodableValue("privateKey"), flutter::EncodableValue(output.privateKey)}
    });
    
    result->Success(&response);
  }
  catch (const std::exception &e)
  {
    result->Error("error", e.what());
  }
}

class FastRsaLinuxPlugin : public flutter::Plugin
{
public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarGlfw *registrar);

  FastRsaLinuxPlugin();

  virtual ~FastRsaLinuxPlugin();

private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

// static
void FastRsaLinuxPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarGlfw *registrar)
{
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "rsa",
          &flutter::StandardMethodCodec::GetInstance());
  auto plugin = std::make_unique<FastRsaLinuxPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

FastRsaLinuxPlugin::FastRsaLinuxPlugin() {}

FastRsaLinuxPlugin::~FastRsaLinuxPlugin() {}

void FastRsaLinuxPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
{
  if (method_call.method_name().compare("decryptOAEP") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptOAEP(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("decryptPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    decryptPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptOAEP") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptOAEP(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "label").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("encryptPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    encryptPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPSS") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPSS(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("signPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    signPKCS1v15(
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPSS") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPSS(
        WriteableChar(ValueOrNull(args, "signature").StringValue()),
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
        move(result));
  }
  else if (method_call.method_name().compare("verifyPKCS1v15") == 0)
  {
    const EncodableMap &args = method_call.arguments()->MapValue();
    verifyPKCS1v15(
        WriteableChar(ValueOrNull(args, "signature").StringValue()),
        WriteableChar(ValueOrNull(args, "message").StringValue()),
        WriteableChar(ValueOrNull(args, "hashName").StringValue()),
        WriteableChar(ValueOrNull(args, "pkcs12").StringValue()),
        WriteableChar(ValueOrNull(args, "passphrase").StringValue()),
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

void FastRsaLinuxPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar)
{
  static auto *plugin_registrars =
      new std::map<FlutterDesktopPluginRegistrarRef,
                   std::unique_ptr<flutter::PluginRegistrarGlfw>>;
  auto insert_result = plugin_registrars->emplace(
      registrar, std::make_unique<flutter::PluginRegistrarGlfw>(registrar));

  FastRsaLinuxPlugin::RegisterWithRegistrar(insert_result.first->second.get());
}
