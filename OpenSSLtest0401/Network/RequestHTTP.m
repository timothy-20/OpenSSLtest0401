//
//  RequestHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RequestHTTP.h"
#import "RSAGenerateKey.h"
#import "GetTokenJWT.h"

@implementation RequestHTTP

-(void)dealloc
{
    self.request = nil;
    self.requestURL = nil;
    self.testString = nil;
}

+ (NSString *)dictionaryToJson:(NSDictionary *)dic
{
    NSString *result = @"";
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&err];
    
    if(! jsonData) {
        NSLog(@"Error: %@", err);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        result = jsonString;
    }
    
    return result;
}

-(id)initWithURL:(NSURL *)inURL
{
    self = [super init];
    
    if(self) {
//        RSAGenerateKey *rsa = [RSAGenerateKey generateKey];
        
        RSAGenerateKey *rsa2 = [[RSAGenerateKey alloc] init];
        
        self.requestURL = [[NSURL alloc] initWithString:MAKE_URL([rsa2 resultRSA])];
        
        self.request = [[NSMutableURLRequest alloc] initWithURL:inURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15.0];
        self.testString = [[NSString alloc] initWithFormat:@"test string"];
        
        NSString *urlString = [NSString stringWithFormat:@"%@", MAKE_URL([rsa2 resultRSA])];
        
        self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        [self.request setHTTPMethod:HTTP_METHOD_GET];
        [self.request setValue:[NSString stringWithFormat:@"application/json"] forHTTPHeaderField:@"Content-Type"];
        [self.request setValue:[NSString stringWithFormat:@"Basic %@", credential] forHTTPHeaderField:@"Authorization"];
        
        GetTokenJWT *xTokenClass = [[GetTokenJWT alloc] init];
        
        [self.request setValue:[NSString stringWithFormat:@"%@", xTokenClass.tokenResult] forHTTPHeaderField:@"X-AUTH-TOKEN"];
        
    }
    
    return self;
}

+(RequestHTTP *)requestWithURL:(NSURL *)inURL
{
    RequestHTTP *request = [[RequestHTTP alloc] initWithURL:inURL];
    
    return request;
}

-(void)requestBody
{
    NSMutableDictionary *jsonBody = [[NSMutableDictionary alloc] init];
    [jsonBody setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].identifierForVendor.UUIDString] forKey:@"deviceId"];
    [jsonBody setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].name] forKey:@"deviceName"];
    [jsonBody setObject:[NSString stringWithFormat:@"ios"] forKey:@"os"];
    [jsonBody setObject:[NSString stringWithFormat:@"%@", [UIDevice currentDevice].systemVersion] forKey:@"osVersion"];
    [jsonBody setObject:[NSString stringWithFormat:@"%@"] forKey:@"appVersion"];
    [jsonBody setObject:@"" forKey:@"token"];
    //json에는 클라이언트 기기 정보가 들어가야 한다.
    
    NSMutableData *body = [[NSMutableData alloc] init];
    [body appendData:[[RequestHTTP dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self.request setHTTPBody:body];
    
//    HTTP Request Body

    self.testString = [[NSString alloc] initWithFormat:@"testString"];
}

@end
