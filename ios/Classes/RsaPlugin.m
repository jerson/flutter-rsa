#import "RsaPlugin.h"

#if __has_include(<Rsa/Rsa.h>)
#import <Rsa/Rsa.h>
#else
@import Rsa;
#endif

@implementation RsaPlugin{
    dispatch_queue_t queue;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"rsa"
            binaryMessenger:[registrar messenger]];
  RsaPlugin* instance = [[RsaPlugin alloc] init];
  [instance setup];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
   
  if ([@"encryptPKCS1v15" isEqualToString:call.method]) {
      
      [self encryptPKCS1v15:[call arguments][@"message"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"encryptOAEP" isEqualToString:call.method]) {
      
      [self encryptOAEP:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"decryptOAEP" isEqualToString:call.method]) {
      
      [self decryptOAEP:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"decryptPKCS1v15" isEqualToString:call.method]) {
      
      [self decryptPKCS1v15:[call arguments][@"message"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
       
  } else if ([@"signPKCS1v15" isEqualToString:call.method]) {
      
      [self signPKCS1v15:[call arguments][@"message"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"signPSS" isEqualToString:call.method]) {
      
      [self signPSS:[call arguments][@"message"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"verifyPKCS1v15" isEqualToString:call.method]) {
      
      [self verifyPKCS1v15:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"verifyPSS" isEqualToString:call.method]) {
      
      [self verifyPSS:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] pkcs12:[call arguments][@"pkcs12"] passphrase:[call arguments][@"passphrase"] result:result];
      
  } else if ([@"base64" isEqualToString:call.method]) {
        [self base64:[call arguments][@"message"] result:result];
        
  } else if ([@"hash" isEqualToString:call.method]) {
         [self hash:[call arguments][@"message"] name:[call arguments][@"name"] result:result];
         
  } else if ([@"generate" isEqualToString:call.method]) {
          [self generate:[call arguments][@"bits"] result:result];
          
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)setup
{
    queue = dispatch_queue_create("fast-rsa", DISPATCH_QUEUE_SERIAL);
}

- (void) encryptPKCS1v15: (NSString *)message
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            
             NSError *error;
             NSString * output = [RsaNewFastRSA() encryptPKCS1v15:message pkcs12:pkcs12 passphrase:passphrase error:&error];

             dispatch_async(dispatch_get_main_queue(), ^(void){
                 if(error!=nil){
                     result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                 }else{
                     result(output);
                 }
             });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
    
}

- (void) encryptOAEP: (NSString *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() encryptOAEP:message label:label hashName:hashName pkcs12:pkcs12 passphrase:passphrase error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}

- (void) decryptOAEP: (NSString *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() decryptOAEP:message label:label hashName:hashName pkcs12:pkcs12 passphrase:passphrase error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}
- (void) decryptPKCS1v15: (NSString *)message
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() decryptPKCS1v15:message pkcs12:pkcs12 passphrase:passphrase error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}

- (void) signPKCS1v15: (NSString *)message
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() signPKCS1v15:message hashName:hashName pkcs12:pkcs12 passphrase:passphrase error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}


- (void) signPSS: (NSString *)message
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() signPSS:message hashName:hashName pkcs12:pkcs12 passphrase:passphrase error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
    
}

- (void) verifyPKCS1v15: (NSString *)signature
                 message: (NSString *)message
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            BOOL ret0_;
            BOOL output = [RsaNewFastRSA() verifyPKCS1v15:signature message:message hashName:hashName pkcs12:pkcs12 passphrase:passphrase ret0_:&ret0_ error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result([NSNumber numberWithBool:output]);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
    
}

- (void) verifyPSS: (NSString *)signature
                 message: (NSString *)message
                 hashName: (NSString *)hashName
                 pkcs12: (NSString *)pkcs12
                 passphrase: (NSString *)passphrase
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            BOOL ret0_;
            BOOL output = [RsaNewFastRSA() verifyPSS:signature message:message hashName:hashName pkcs12:pkcs12 passphrase:passphrase ret0_:&ret0_ error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result([NSNumber numberWithBool:output]);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });

}

- (void) hash: (NSString *)message
                 name: (NSString *)name
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() hash:message name:name error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}

- (void) base64: (NSString *)message
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [RsaNewFastRSA() base64:message error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(output);
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
    
}

- (void) generate: (NSNumber *)bits
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            RsaKeyPair * output = [RsaNewFastRSA() generate:[bits floatValue] error:&error];

            dispatch_async(dispatch_get_main_queue(), ^(void){
                if(error!=nil){
                    result([FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]);
                }else{
                    result(@{
                              @"publicKey":output.publicKey,
                              @"privateKey":output.privateKey,
                            });
                }
            });
        }
        @catch (NSException * e) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                result([FlutterError errorWithCode:e.name message:e.reason details:nil]);
            });
        }
    });
}


@end
