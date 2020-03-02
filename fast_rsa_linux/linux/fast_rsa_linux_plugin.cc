#include "fast_rsa_linux_plugin.h"

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_glfw.h>
#include <flutter/standard_method_codec.h>
#include <sys/utsname.h>

#include <map>
#include <memory>
#include <sstream>

namespace
{

// *** Rename this class to match the linux pluginClass in your pubspec.yaml.
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
  // *** Replace the "getPlatformVersion" check with your plugin's method names.
  if (method_call.method_name().compare("getPlatformVersion") == 0)
  {
    struct utsname uname_data = {};
    uname(&uname_data);
    std::ostringstream version_stream;
    version_stream << "Linux " << uname_data.version;
    flutter::EncodableValue response(version_stream.str());
    result->Success(&response);
  }
  else if (method_call.method_name().compare("encryptOAEP") == 0)
  {
    struct utsname uname_data = {};
    uname(&uname_data);
    std::ostringstream version_stream;
    version_stream << "dod ";
    flutter::EncodableValue response(version_stream.str());
    result->Success(&response);
  }
  else
  {
    std::ostringstream version_stream;
    version_stream << "Ohter ";
    flutter::EncodableValue response(version_stream.str());
    result->Success(&response);
    // result->NotImplemented();
  }
}

} // namespace

void FastRsaLinuxPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar)
{
  // The plugin registrar wrappers owns the plugins, registered callbacks, etc.,
  // so must remain valid for the life of the application.
  static auto *plugin_registrars =
      new std::map<FlutterDesktopPluginRegistrarRef,
                   std::unique_ptr<flutter::PluginRegistrarGlfw>>;
  auto insert_result = plugin_registrars->emplace(
      registrar, std::make_unique<flutter::PluginRegistrarGlfw>(registrar));

  FastRsaLinuxPlugin::RegisterWithRegistrar(insert_result.first->second.get());
}
