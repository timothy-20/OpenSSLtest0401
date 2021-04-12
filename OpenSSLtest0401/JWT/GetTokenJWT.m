//
//  GetTokenJWT.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/07.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "GetTokenJWT.h"

#import <JWT/JWT.h>

#define algorithmName @"HS256"
#define publicKey @"6012dddcc7e9b8975590f91e8effc046e8e9aaac"

@implementation GetTokenJWT

-(void)dealloc
{
    self.tokenResult = nil;
}

-(id)init
{
    self = [super init];
    if (self) {
        JWTClaimsSet *claimSet = [[JWTClaimsSet alloc] init];
        claimSet.subject = @"sub";
        claimSet.issuer = @"cubelogin";
        claimSet.expirationDate = [NSDate date];
        claimSet.audience = @"{{http_request_server}}/provision/validation/";
        
        NSDictionary *header = @{
            @"typ":@"JWT",
            @"alg":@"HS256"
        };
        
        id<JWTAlgorithm> algorithm = [JWTAlgorithmFactory algorithmByName:algorithmName];
        JWTBuilder *encodeBuilder = [JWT encodeClaimsSet: claimSet];
        
        self.tokenResult = encodeBuilder.secret(publicKey).algorithm(algorithm).headers(header).encode;
    }
    
    return self;
}

+(GetTokenJWT *)XAuthToken
{
    GetTokenJWT *token = [[GetTokenJWT alloc] init];
    return token;
}

@end
