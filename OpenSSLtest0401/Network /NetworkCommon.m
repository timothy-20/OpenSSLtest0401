//
//  NetworkCommon.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/14.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkCommon.h"
#import "GenerateRSAKey.h"

@implementation NetworkCommon

+(NSString *)getAuthRequestWithResponse:(networkResponseBlock)handlerResponse
{
    GenerateRSAKey *rsa = [GenerateRSAKey sendPublicKey];
    NSString *publicKey = rsa.publicKeyRSA;
    
    NSMutableString *urlStr = [NSMutableString stringWithString:MAKE_URL(publicKey)];
    NetworkRequestHTTP *pRequest = [NetworkRequestHTTP requestWithURL:[NSURL URLWithString:urlStr]];
    
    [NetworkManagerHTTP request:pRequest inResponse:handlerResponse];
    return pRequest.requestID;
}

@end
