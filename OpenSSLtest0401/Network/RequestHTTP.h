//
//  RequestHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVER_URL @"https://10.10.20.51:9443/test/validation/"
#define MAKE_URL(API) ([NSString stringWithFormat:@"%@%@",SERVER_URL ,API])

#define credential @"NjAxMmRkZGNjN2U5Yjg5NzU1OTBmOTFlOGVmZmMwNDZlOGU5YWFhYzoyZjljNjJjYzI1OGJhODQ3MGFkNGExNGI1YmQ1MDYyYTQzM2FhNTNj"

#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"

typedef NSString *netRequestMethod;

@interface RequestHTTP : NSObject

@property (nonatomic, strong) NSMutableURLRequest *request;
@property (nonatomic, strong) NSString *testString;
@property (nonatomic, strong) NSURL *requestURL;

//@property (nonatomic, strong) RSAGenerateKey *mPathKey;
//@property (nonatomic, strong) GetTokenJWT *xTokenClass;

-(void)requestBody;
+(RequestHTTP *)requestWithURL:(NSURL *)inURL;

@end
