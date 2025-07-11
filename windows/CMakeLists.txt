cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "fast_rsa")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "fast_rsa_plugin")

add_library(${PLUGIN_NAME} SHARED
  "fast_rsa_plugin.cpp"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

set(BUILD_BUNDLE_DIR "$<TARGET_FILE_DIR:${BINARY_NAME}>")

set(LIBRSA_BRIDGE "librsa_bridge.dll")
set(LIBRSA_BRIDGE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/shared/${LIBRSA_BRIDGE}")
# List of absolute paths to libraries that should be bundled with the plugin
set(fast_rsa_bundled_libraries
  ${LIBRSA_BRIDGE_PATH}
  PARENT_SCOPE
)