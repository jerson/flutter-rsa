#include "include/fast_rsa/fast_rsa_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>
#include <sys/utsname.h>

#include <cstring>

#define FAST_RSA_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), fast_rsa_plugin_get_type(), \
                              FastRsaPlugin))

struct _FastRsaPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(FastRsaPlugin, fast_rsa_plugin, g_object_get_type())

// Called when a method call is received from Flutter.
static void fast_rsa_plugin_handle_method_call(
    FastRsaPlugin* self,
    FlMethodCall* method_call) {
  g_autoptr(FlMethodResponse) response = nullptr;

   response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());

  fl_method_call_respond(method_call, response, nullptr);
}

static void fast_rsa_plugin_dispose(GObject* object) {
  G_OBJECT_CLASS(fast_rsa_plugin_parent_class)->dispose(object);
}

static void fast_rsa_plugin_class_init(FastRsaPluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = fast_rsa_plugin_dispose;
}

static void fast_rsa_plugin_init(FastRsaPlugin* self) {}

static void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  FastRsaPlugin* plugin = FAST_RSA_PLUGIN(user_data);
  fast_rsa_plugin_handle_method_call(plugin, method_call);
}

void fast_rsa_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  FastRsaPlugin* plugin = FAST_RSA_PLUGIN(
      g_object_new(fast_rsa_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                            "fast_rsa",
                            FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(channel, method_call_cb,
                                            g_object_ref(plugin),
                                            g_object_unref);

  g_object_unref(plugin);
}
