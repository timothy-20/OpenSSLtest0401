//
//  NetworkRequestHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVER_URL @"https://10.10.20.51:9443/provision/test/"
#define BASIC_AUTH @"NjAxMmRkZGNjN2U5Yjg5NzU1OTBmOTFlOGVmZmMwNDZlOGU5YWFhYzoyZjljNjJjYzI1OGJhODQ3MGFkNGExNGI1YmQ1MDYyYTQzM2FhNTNj"

#define MAKE_URL(API) ([NSString stringWithFormat:@"%@%@",SERVER_URL,API])

#define HTTP_METHOD_GET @"GET"
#define HTTP_METHOD_POST @"POST"

#define TOKEN_SECRET @"6012dddcc7e9b8975590f91e8effc046e8e9aaac"

@interface NetworkRequestHTTP : NSObject

@property (nonatomic, strong) NSString *requestID;
@property (nonatomic, strong) NSMutableURLRequest *urlRequest;

+(NetworkRequestHTTP *)requestWithURL:(NSURL *)url;
-(void)requestBody;

@end
