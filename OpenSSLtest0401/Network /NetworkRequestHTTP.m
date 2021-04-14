//
//  NetworkRequestHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkRequestHTTP.h"

#import "TokenParser.h"
#import "JWTTokenFactory.h"

@implementation NetworkRequestHTTP

-(void)dealloc
{
    self.requestData = nil;
    self.requestID = nil;
    self.urlRequest = nil;
}

-(id)initWithURL:(NSURL *)url
{
    self = [super init];
    
    if (self) {
        TokenParser *ak = [TokenParser sendActivationKey];
        NSString *parsedAK = ak.activationKey;
        
        JWTTokenFactory *token = [JWTTokenFactory sendXAuthToken:@"" inSubject:@"" inPlainData:parsedAK];
        NSString *xTokenAuth = [token requestToken];
        
    }
    
    return self;
}

@end
