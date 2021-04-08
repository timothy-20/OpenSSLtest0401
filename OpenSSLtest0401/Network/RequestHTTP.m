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

#define URL @"https://10.10.20.51:9443/provision/validation/"
#define MAKE_URL(API) ([NSString stringWithFormat:@"%@%@",URL ,API])

#define credential @"NjAxMmRkZGNjN2U5Yjg5NzU1OTBmOTFlOGVmZmMwNDZlOGU5YWFhYzoyZjljNjJjYzI1OGJhODQ3MGFkNGExNGI1YmQ1MDYyYTQzM2FhNTNj"

#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"

@implementation RequestHTTP

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


- (void)requestAuth
{
    RSAGenerateKey *mPathAK = [[RSAGenerateKey alloc] init];
    NSString *activationKey = [mPathAK EncryptionWithRSA];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@", MAKE_URL(activationKey)];
    NSLog(@"%@", urlStr);
    
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:HTTP_METHOD_POST];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"Basic %@", credential] forHTTPHeaderField:@"Authorization"];
    
    GetTokenJWT *xTokenClass = [[GetTokenJWT alloc] init];
    NSString *xToken = [xTokenClass XAuthToken];
    
    [request setValue:xToken forHTTPHeaderField:@"X-AUTH-TOKEN"];
    
//    HTTP Request Header
    
    NSMutableDictionary *jsonBody = [[NSMutableDictionary alloc] init];
    [jsonBody setObject:@"test" forKey:@"key1"];
    [jsonBody setObject:@"test" forKey:@"key2"];
    
    NSMutableData *body = [[NSMutableData alloc] init];
    [body appendData:[[RequestHTTP dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[[NSString dictionaryToJson:jsonBody] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
//    HTTP Request Body
    
}

@end
