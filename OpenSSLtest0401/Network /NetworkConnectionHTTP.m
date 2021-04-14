//
//  NetworkConnectionHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/14.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkConnectionHTTP.h"
#import "NetworkRequestHTTP.h"
#import "NetworkResponseHTTP.h"

@implementation NetworkConnectionHTTP

-(void)dealloc
{
    self.requestID = nil;
    self.networkRequest = nil;
    self.networkResponse = nil;
}

-(id)initWithRequest:(NetworkRequestHTTP *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
    self = [super initWithRequest:request.urlRequest delegate:(id)delegate startImmediately:(BOOL)startImmediately];
    
    self.networkResponse = [[NetworkResponseHTTP alloc] init];
    [self.networkResponse setNetworkRequest:request];
    
    self.networkRequest = request;
    self.requestID = self.networkRequest.requestID;
    
    return self;
}

@end
