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

#import "Request/RequestHTTP.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RSAGenerateKey *RSA = [[RSAGenerateKey alloc] init];
    RSAGenWithSecurity *JWT = [[RSAGenWithSecurity alloc] init];
    RequestHTTP *req = [[RequestHTTP alloc] init];
    
//    [JWT JWTEncodeHS];
//    [JWT ParseJWT];
    
//    [req requestAuth];
    
    [RSA EncryptionWithRSA];
}


@end
