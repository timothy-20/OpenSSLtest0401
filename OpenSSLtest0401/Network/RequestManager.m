//
//  RequestManager.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/09.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RequestManager.h"

#import "ConnectionHTTP.h"
#import "ResponseHTTP.h"

@implementation RequestManager

//-(void)sendRequestData
//{
//    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//
//    NSLog(@"URL: %@", [[self.requestClass request] URL]);
//    NSDictionary *headerField = [[self.requestClass request] allHTTPHeaderFields];
//    NSLog(@"request Header: %@", headerField);
//
//    NSLog(@"%@", [self.requestClass testString]);
//
//    NSData *bodyField = [[self.requestClass request] HTTPBody];
//    if(nil != bodyField) {
//        NSString *bodyFieldString = [[NSString alloc] initWithData:bodyField encoding:NSUTF8StringEncoding];
//        NSLog(@"request Body: %@", bodyFieldString);
//    }
//}

-(void)log
{
    RequestHTTP *inRequest = [[RequestHTTP alloc] init];
    NSURL *url =  inRequest.requestURL;
    
    RequestHTTP *request = [RequestHTTP requestWithURL:url];
    
    NSLog(@"%@", request.request.URL);
    NSLog(@"%@", request.request.allHTTPHeaderFields);
    

//    NSLog(@"URL: %@", inRequest.request.URL);
//    NSLog(@"dicHeaderData: %@", inRequest.request.allHTTPHeaderFields);
//    NSLog(@"%@", inRequest.testString);
}

@end
