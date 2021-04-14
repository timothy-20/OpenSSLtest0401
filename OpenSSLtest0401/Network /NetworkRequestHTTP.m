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

#import <UIKit/UIKit.h>

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
        
        JWTTokenFactory *token = [JWTTokenFactory sendXAuthToken:TOKEN_SECRET inSubject:@"ak" inPlainData:parsedAK];
        NSString *xTokenAuth = [token requestToken];
        
        self.urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15.0];
        
        [self.urlRequest setHTTPMethod:HTTP_METHOD_POST];
        [self.urlRequest setValue:[NSString stringWithFormat:@"application/json"] forHTTPHeaderField:@"Content-Type"];
        [self.urlRequest setValue:[NSString stringWithFormat:@"Basic %@", BASIC_AUTH] forHTTPHeaderField:@"Authorization"];
        [self.urlRequest setValue:[NSString stringWithString:xTokenAuth] forHTTPHeaderField:@"X-AUTH-TOKEN"];
        //request Header
        
        [self sendDeviceInfo];
        //request Body
        
        self.requestID = [self.requestData objectForKey:@"deviceId"];
    }
    
    return self;
}

+(NetworkRequestHTTP *)requestWithURL
{
    return [[NetworkRequestHTTP alloc] initWithURL:<#(NSURL *)#>];
}

-(void)sendDeviceInfo
{
    NSMutableDictionary *deviceInfo = [NSMutableDictionary dictionary];
    
    [deviceInfo setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].identifierForVendor.UUIDString] forKey:@"deviceId"];
    [deviceInfo setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].name] forKey:@"deviceName"];
    [deviceInfo setObject:[NSString stringWithFormat:@"ios"] forKey:@"os"];
    [deviceInfo setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].systemVersion] forKey:@"osVersion"];
    [deviceInfo setObject:[NSString stringWithFormat:@"%@", [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleShortVersionString"]] forKey:@"appVersion"];
    [deviceInfo setObject:[NSString stringWithFormat:@"null"] forKey:@"token"];
    
    [self.requestData setDictionary:deviceInfo];
}

@end
