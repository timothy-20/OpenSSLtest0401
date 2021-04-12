//
//  ViewController.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/01.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "ViewController.h"

#import "RSAGenerateKey.h"
#import "RSAGenWithSecurity.h"

#import "GetTokenJWT.h"
#import "RequestHTTP.h"
#import "RequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    RSAGenerateKey *RSA = [[RSAGenerateKey alloc] init];
//    RSAGenWithSecurity *JWT = [[RSAGenWithSecurity alloc] init];
//    RequestHTTP *req = [[RequestHTTP alloc] init];
//    GetTokenJWT *token = [[GetTokenJWT alloc] init];
    RequestManager *reqManager = [[RequestManager alloc] init];
    
//    [JWT JWTEncodeHS];
//    [JWT ParseJWT];
    
//    [req requestAuth];
    [reqManager log];
    
//    [RSA EncryptionWithRSA];
    
//    NSString *str = @"c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b";
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *base64Str = [data base64EncodedStringWithOptions:0];
//
//    NSLog(@"%@", base64Str);
    
    
}


@end
