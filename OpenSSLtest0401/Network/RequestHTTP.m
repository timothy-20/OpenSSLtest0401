//
//  RequestHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RequestHTTP.h"
#import "RSAGenerateKey.h"
#import "GetTokenJWT.h"

@implementation RequestHTTP

-(void)dealloc
{
    self.request = nil;
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
        self.request = [[NSMutableURLRequest alloc] initWithURL:inURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15.0];
        self.testString = [[NSString alloc] initWithFormat:@"test string"];
        
        NSString *urlString = [NSString stringWithFormat:@"%@", MAKE_URL([self.mPathKey EncryptionWithRSA])];
        NSLog(@"%@", urlString);
        
        self.request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        [self.request setHTTPMethod:HTTP_METHOD_GET];
        [self.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.request setValue:[NSString stringWithFormat:@"Basic %@", credential] forHTTPHeaderField:@"Authorization"];
        
        
        
    }
    
    return self;
}


-(void)requestAuth
{
    RSAGenerateKey *mPathAK = [[RSAGenerateKey alloc] init];
    NSString *activationKey = [mPathAK EncryptionWithRSA];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@", MAKE_URL(activationKey)];
    NSLog(@"%@", urlStr);
    
    NSURL *url = [NSURL URLWithString: urlStr];
    self.request = [NSMutableURLRequest requestWithURL:url];
    
    [self.request setHTTPMethod:HTTP_METHOD_GET];
    
    [self.request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [self.request setValue:[NSString stringWithFormat:@"Basic %@", credential] forHTTPHeaderField:@"Authorization"];
    
    GetTokenJWT *xTokenClass = [[GetTokenJWT alloc] init];
    NSString *xToken = [xTokenClass XAuthToken];
    
    [self.request setValue:xToken forHTTPHeaderField:@"X-AUTH-TOKEN"];
    
//    HTTP Request Header
    
    NSMutableDictionary *jsonBody = [[NSMutableDictionary alloc] init];
    [jsonBody setObject:@"test" forKey:@"key1"];
    [jsonBody setObject:@"test" forKey:@"key2"];
    
    NSMutableData *body = [[NSMutableData alloc] init];
    [body appendData:[[RequestHTTP dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self.request setHTTPBody:body];
    
//    HTTP Request Body

    self.testString = [[NSString alloc] initWithFormat:@"testString"];
}

@end
