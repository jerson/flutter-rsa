#import "RsaPlugin.h"

#if __has_include(<Rsa/Rsa.h>)
#import <Rsa/Rsa.h>
#else
@import Rsa;
#endif

@implementation RsaPlugin{
    dispatch_queue_t queue;
    RsaFastRSA *instance;
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
   
  if ([@"convertJWKToPrivateKey" isEqualToString:call.method]) {
      
      [self convertJWKToPrivateKey:[call arguments][@"data"] keyId:[call arguments][@"keyId"] result:result];
      
  } else if ([@"convertJWKToPublicKey" isEqualToString:call.method]) {
      
      [self convertJWKToPublicKey:[call arguments][@"data"] keyId:[call arguments][@"keyId"] result:result];
      
  } else if ([@"convertKeyPairToPKCS12" isEqualToString:call.method]) {
      
      [self convertKeyPairToPKCS12:[call arguments][@"privateKey"] certificate:[call arguments][@"certificate"] password:[call arguments][@"password"] result:result];
      
  } else if ([@"convertPKCS12ToKeyPair" isEqualToString:call.method]) {
      
      [self convertPKCS12ToKeyPair:[call arguments][@"pkcs12"] password:[call arguments][@"password"] result:result];
      
  } else if ([@"convertPrivateKeyToPKCS8" isEqualToString:call.method]) {
      
      [self convertPrivateKeyToPKCS8:[call arguments][@"privateKey"] result:result];
      
  } else if ([@"convertPrivateKeyToPKCS1" isEqualToString:call.method]) {
      
      [self convertPrivateKeyToPKCS1:[call arguments][@"privateKey"]  result:result];
      
  } else if ([@"convertPrivateKeyToJWK" isEqualToString:call.method]) {
      
      [self convertPrivateKeyToJWK:[call arguments][@"privateKey"] result:result];
      
  } else if ([@"convertPrivateKeyToPublicKey" isEqualToString:call.method]) {
      
      [self convertPrivateKeyToPublicKey:[call arguments][@"privateKey"]  result:result];
      
  } else if ([@"convertPublicKeyToPKIX" isEqualToString:call.method]) {
      
      [self convertPublicKeyToPKIX:[call arguments][@"publicKey"]  result:result];
      
  } else if ([@"convertPublicKeyToPKCS1" isEqualToString:call.method]) {
      
      [self convertPublicKeyToPKCS1:[call arguments][@"publicKey"]  result:result];
      
  } else if ([@"convertPublicKeyToJWK" isEqualToString:call.method]) {
      
      [self convertPublicKeyToJWK:[call arguments][@"publicKey"]  result:result];
      
  } else if ([@"decryptPrivateKey" isEqualToString:call.method]) {
      
      [self decryptPrivateKey:[call arguments][@"privateKeyEncrypted"] password:[call arguments][@"password"] result:result];
      
  }  else if ([@"encryptPrivateKey" isEqualToString:call.method]) {
      
      [self encryptPrivateKey:[call arguments][@"privateKey"] password:[call arguments][@"password"] cipherName:[call arguments][@"cipherName"] result:result];
      
  } else if ([@"encryptOAEP" isEqualToString:call.method]) {
      
      [self encryptOAEP:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] publicKey:[call arguments][@"publicKey"]  result:result];
      
  } else if ([@"encryptOAEPBytes" isEqualToString:call.method]) {
      
      [self encryptOAEPBytes:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] publicKey:[call arguments][@"publicKey"]  result:result];
      
  } else if ([@"decryptOAEP" isEqualToString:call.method]) {
       
       [self decryptOAEP:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] privateKey:[call arguments][@"privateKey"] result:result];
       
  } else if ([@"decryptOAEPBytes" isEqualToString:call.method]) {
        
        [self decryptOAEPBytes:[call arguments][@"message"] label:[call arguments][@"label"] hashName:[call arguments][@"hashName"] privateKey:[call arguments][@"privateKey"] result:result];
        
  } else if ([@"encryptPKCS1v15" isEqualToString:call.method]) {
         
         [self encryptPKCS1v15:[call arguments][@"message"] publicKey:[call arguments][@"publicKey"] result:result];
          
  } else if ([@"encryptPKCS1v15Bytes" isEqualToString:call.method]) {
         
         [self encryptPKCS1v15Bytes:[call arguments][@"message"] publicKey:[call arguments][@"publicKey"] result:result];
          
  } else if ([@"decryptPKCS1v15" isEqualToString:call.method]) {
       
       [self decryptPKCS1v15:[call arguments][@"message"] privateKey:[call arguments][@"privateKey"] result:result];
        
  } else if ([@"decryptPKCS1v15Bytes" isEqualToString:call.method]) {
       
       [self decryptPKCS1v15Bytes:[call arguments][@"message"] privateKey:[call arguments][@"privateKey"] result:result];
        
  } else if ([@"signPKCS1v15" isEqualToString:call.method]) {
      
      [self signPKCS1v15:[call arguments][@"message"] hashName:[call arguments][@"hashName"] privateKey:[call arguments][@"privateKey"] result:result];
      
  } else if ([@"signPKCS1v15Bytes" isEqualToString:call.method]) {
      
      [self signPKCS1v15Bytes:[call arguments][@"message"] hashName:[call arguments][@"hashName"] privateKey:[call arguments][@"privateKey"] result:result];
      
  } else if ([@"signPSS" isEqualToString:call.method]) {
      
      [self signPSS:[call arguments][@"message"] hashName:[call arguments][@"hashName"] saltLengthName:[call arguments][@"saltLengthName"] privateKey:[call arguments][@"privateKey"] result:result];
      
  }else if ([@"signPSSBytes" isEqualToString:call.method]) {
      
      [self signPSSBytes:[call arguments][@"message"] hashName:[call arguments][@"hashName"] saltLengthName:[call arguments][@"saltLengthName"] privateKey:[call arguments][@"privateKey"] result:result];
      
  } else if ([@"verifyPKCS1v15" isEqualToString:call.method]) {
      
      [self verifyPKCS1v15:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] publicKey:[call arguments][@"publicKey"] result:result];
      
  } else if ([@"verifyPKCS1v15Bytes" isEqualToString:call.method]) {
      
      [self verifyPKCS1v15Bytes:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] publicKey:[call arguments][@"publicKey"] result:result];
      
  } else if ([@"verifyPSS" isEqualToString:call.method]) {
      
      [self verifyPSS:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] saltLengthName:[call arguments][@"saltLengthName"] publicKey:[call arguments][@"publicKey"] result:result];
      
  } else if ([@"verifyPSSBytes" isEqualToString:call.method]) {
      
      [self verifyPSSBytes:[call arguments][@"signature"] message:[call arguments][@"message"] hashName:[call arguments][@"hashName"] saltLengthName:[call arguments][@"saltLengthName"] publicKey:[call arguments][@"publicKey"] result:result];
      
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
    instance = RsaNewFastRSA();
}

- (void)result: (FlutterResult)result output:(id) output
{
    dispatch_async(dispatch_get_main_queue(), ^(void){
        result(output);
    });
}

- (void) convertJWKToPrivateKey: (NSString *)data
                 keyId: (NSString *)keyId
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertJWKToPrivateKey:data keyID:keyId error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertJWKToPublicKey: (NSString *)data
                 keyId: (NSString *)keyId
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertJWKToPublicKey:data keyID:keyId error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertKeyPairToPKCS12: (NSString *)privateKey
                 certificate: (NSString *)certificate
                 password: (NSString *)password
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertKeyPairToPKCS12:privateKey certificate:certificate password:password  error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPKCS12ToKeyPair: (NSString *)pkcs12
                 password: (NSString *)password
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            RsaPKCS12KeyPair * output = [self->instance convertPKCS12ToKeyPair:pkcs12 password:password  error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:@{
                              @"privateKey":output.privateKey,
                              @"publicKey":output.publicKey,
                              @"certificate":output.certificate,
                            }];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPrivateKeyToPKCS8: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPrivateKeyToPKCS8:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPrivateKeyToPKCS1: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPrivateKeyToPKCS1:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPrivateKeyToJWK: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPrivateKeyToJWK:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPrivateKeyToPublicKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPrivateKeyToPublicKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPublicKeyToPKIX: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPublicKeyToPKIX:publicKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPublicKeyToPKCS1: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPublicKeyToPKCS1:publicKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) convertPublicKeyToJWK: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance convertPublicKeyToJWK:publicKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}


- (void) decryptPrivateKey: (NSString *)privateKeyEncrypted
                 password: (NSString *)password
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance decryptPrivateKey:privateKeyEncrypted password:password error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) encryptPrivateKey: (NSString *)privateKey
                 password: (NSString *)password
                 cipherName: (NSString *)cipherName
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance encryptPrivateKey:privateKey password:password cipherName:cipherName error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) encryptPKCS1v15: (NSString *)message
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance encryptPKCS1v15:message publicKey:publicKey  error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) encryptPKCS1v15Bytes: (FlutterStandardTypedData *)message
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance encryptPKCS1v15Bytes:message.data publicKey:publicKey  error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) encryptOAEP: (NSString *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance encryptOAEP:message label:label hashName:hashName publicKey:publicKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) encryptOAEPBytes: (FlutterStandardTypedData *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance encryptOAEPBytes:message.data label:label hashName:hashName publicKey:publicKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) decryptOAEP: (NSString *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance decryptOAEP:message label:label hashName:hashName privateKey:privateKey error:&error];
            
            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) decryptOAEPBytes: (FlutterStandardTypedData *)message
                 label: (NSString *)label
                 hashName: (NSString *)hashName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance decryptOAEPBytes:message.data label:label hashName:hashName privateKey:privateKey error:&error];
            
            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) decryptPKCS1v15: (NSString *)message
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance decryptPKCS1v15:message privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) decryptPKCS1v15Bytes: (FlutterStandardTypedData *)message
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance decryptPKCS1v15Bytes:message.data privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) signPKCS1v15: (NSString *)message
                 hashName: (NSString *)hashName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance signPKCS1v15:message hashName:hashName privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) signPKCS1v15Bytes: (FlutterStandardTypedData *)message
                 hashName: (NSString *)hashName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance signPKCS1v15Bytes:message.data hashName:hashName privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}


- (void) signPSS: (NSString *)message
                 hashName: (NSString *)hashName
                 saltLengthName: (NSString *)saltLengthName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance signPSS:message hashName:hashName saltLengthName:saltLengthName privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}


- (void) signPSSBytes: (FlutterStandardTypedData *)message
                 hashName: (NSString *)hashName
                 saltLengthName: (NSString *)saltLengthName
                 privateKey: (NSString *)privateKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSData * output = [self->instance signPSSBytes:message.data hashName:hashName saltLengthName:saltLengthName privateKey:privateKey error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[FlutterStandardTypedData typedDataWithBytes:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) verifyPKCS1v15: (NSString *)signature
                     message: (NSString *)message
                     hashName: (NSString *)hashName
                     publicKey: (NSString *)publicKey
                     result:(FlutterResult)result
{
        dispatch_async(queue, ^(void){
            @try {
                NSError *error;
                BOOL ret0_;
                BOOL output = [self->instance verifyPKCS1v15:signature message:message hashName:hashName publicKey:publicKey ret0_:&ret0_ error:&error];

                if(error!=nil){
                    [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
                }else{
                    [self result:result output:[NSNumber numberWithBool:output]];
                }
            }
            @catch (NSException * e) {
                [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
            }
        });
        
}
    

- (void) verifyPKCS1v15Bytes: (FlutterStandardTypedData *)signature
                     message: (FlutterStandardTypedData *)message
                     hashName: (NSString *)hashName
                     publicKey: (NSString *)publicKey
                     result:(FlutterResult)result
{
        dispatch_async(queue, ^(void){
            @try {
                NSError *error;
                BOOL ret0_;
                BOOL output = [self->instance verifyPKCS1v15Bytes:signature.data message:message.data hashName:hashName publicKey:publicKey ret0_:&ret0_ error:&error];

                if(error!=nil){
                    [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
                }else{
                    [self result:result output:[NSNumber numberWithBool:output]];
                }
            }
            @catch (NSException * e) {
                [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
            }
        });
        
}

- (void) verifyPSS: (NSString *)signature
                 message: (NSString *)message
                 hashName: (NSString *)hashName
                 saltLengthName: (NSString *)saltLengthName
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            BOOL ret0_;
            BOOL output = [self->instance verifyPSS:signature message:message hashName:hashName saltLengthName:saltLengthName publicKey:publicKey ret0_:&ret0_ error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[NSNumber numberWithBool:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });

}

- (void) verifyPSSBytes: (FlutterStandardTypedData *)signature
                 message: (FlutterStandardTypedData *)message
                 hashName: (NSString *)hashName
                 saltLengthName: (NSString *)saltLengthName
                 publicKey: (NSString *)publicKey
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            BOOL ret0_;
            BOOL output = [self->instance verifyPSSBytes:signature.data message:message.data hashName:hashName saltLengthName:saltLengthName publicKey:publicKey ret0_:&ret0_ error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:[NSNumber numberWithBool:output]];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
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
            NSString * output = [self->instance hash:message name:name error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}

- (void) base64: (NSString *)message
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            NSString * output = [self->instance base64:message error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:output];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
    
}

- (void) generate: (NSNumber *)bits
                 result:(FlutterResult)result
{
    dispatch_async(queue, ^(void){
        @try {
            NSError *error;
            RsaKeyPair * output = [self->instance generate:[bits floatValue] error:&error];

            if(error!=nil){
                [self result:result output:[FlutterError errorWithCode:[NSString stringWithFormat:@"%ld", error.code] message:error.description details:nil]];
            }else{
                [self result:result output:@{
                              @"privateKey":output.privateKey,
                              @"publicKey":output.publicKey,
                            }];
            }
        }
        @catch (NSException * e) {
            [self result:result output:[FlutterError errorWithCode:e.name message:e.reason details:nil]];
        }
    });
}


@end
