#import "FlutterCountryPickerPlugin.h"

@implementation FlutterCountryPickerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {

  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"biessek.rocks/flutter_country_picker"
                                  binaryMessenger:[registrar messenger]];
  FlutterCountryPickerPlugin* instance = [[FlutterCountryPickerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}



- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     if ([@"getCountryNames" isEqualToString:call.method]) {
        NSArray *isoCodes =  call.arguments[@"isoCodes"];
        NSMutableDictionary *countryNames = [[NSMutableDictionary alloc]initWithCapacity: [isoCodes count]];
        NSLocale *currentLocale = [NSLocale currentLocale];

        for (id code in isoCodes) {
            [countryNames setObject:[currentLocale displayNameForKey:NSLocaleCountryCode value:[code lowercaseString]] forKey:code];
        }
    	result(countryNames);
    } else {
    	result(FlutterMethodNotImplemented);
    }
}

@end
