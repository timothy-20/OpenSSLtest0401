//
//  RequestHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RequestHTTP.h"
#import "RSAGenWithSecurity.h"

#define URL @"https://10.10.20.51:9443/provision/validation/"
#define MAKE_URL(API) ([NSString stringWithFormat:@"%@%@",URL ,API])

#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"

@implementation RequestHTTP

-(void)requestAuth
{
    RSAGenWithSecurity *keyClass = [[RSAGenWithSecurity alloc] init];
    NSString *activationKey = [keyClass ParseJWT];
    
    NSString *str = [NSString stringWithFormat:@"%@", MAKE_URL(@"test")];
    NSLog(@"%@", str);
}

@end
