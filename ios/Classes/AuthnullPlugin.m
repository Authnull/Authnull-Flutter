#import "AuthnullPlugin.h"
#if __has_include(<authnull/authnull-Swift.h>)
#import <authnull/authnull-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "authnull-Swift.h"
#endif

@implementation AuthnullPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAuthnullPlugin registerWithRegistrar:registrar];
}
@end
