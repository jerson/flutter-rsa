#import "FastRsaPlugin.h"
#if __has_include(<fast_rsa/fast_rsa-Swift.h>)
#import <fast_rsa/fast_rsa-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fast_rsa-Swift.h"
#endif

@implementation FastRsaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFastRsaPlugin registerWithRegistrar:registrar];
}
@end
