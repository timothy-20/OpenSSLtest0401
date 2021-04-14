//
//  JWTTokenFactory.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "JWTTokenFactory.h"

#include <JWT/JWT.h>

#define ENCODE_ALGORITHM @"HS256"

@implementation JWTTokenFactory

-(void)dealloc
{
    self.requestToken = nil;
}

-(id)initWithPublicKey:(NSString *)publicKey inSubject:(NSString *)sub inPlainData:(NSString *)plainData
{
    self = [super init];
    
    if(self) {
        NSDictionary *tokenHeader = @{
            @"typ":@"JWT",
            @"alg":@"HS256"
        };
        
        NSDictionary *tokenPayload = @{
            [NSString stringWithFormat:@"data"]:[NSString stringWithString:plainData]
        };
        
        NSDate *currentDate = [NSDate date];
        NSDate *expirationDate = [NSDate distantPast];
        
        JWTClaimsSet *claimSet = [[JWTClaimsSet alloc] init];
        claimSet.subject = sub;
        claimSet.issuedAt = currentDate;
        claimSet.expirationDate = expirationDate;
        
        id<JWTAlgorithm> algorithm = [JWTAlgorithmFactory algorithmByName:ENCODE_ALGORITHM];
        
        JWTBuilder *encodeBuilder = [[JWTBuilder alloc] init];
        
        encodeBuilder.headers(tokenHeader);
        encodeBuilder.payload(tokenPayload);
        encodeBuilder.claimsSet(claimSet);
        
        encodeBuilder.algorithm(algorithm);
        encodeBuilder.secret(publicKey);
        
        self.requestToken = encodeBuilder.encode;
    }
    
    return self;
}

+(JWTTokenFactory *)sendXAuthToken:(NSString *)publicKey inSubject:(NSString *)sub inPlainData:(NSString *)plainData
{
    return [[JWTTokenFactory alloc] initWithPublicKey:publicKey inSubject:sub inPlainData:plainData];
}

@end
