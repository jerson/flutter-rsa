//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <fast_rsa/fast_rsa_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) fast_rsa_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FastRsaPlugin");
  fast_rsa_plugin_register_with_registrar(fast_rsa_registrar);
}
