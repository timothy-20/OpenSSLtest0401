//
//  ConnectionHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/12.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "ConnectionHTTP.h"
#import "RequestHTTP.h"
#import "ResponseHTTP.h"

@implementation ConnectionHTTP

-(void)dealloc
{
    self.requestObject = nil;
    self.responseObject = nil;
}

-(id)initWithRequest:(RequestHTTP *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
    self = [super init];
    
    self.responseObject = [[ResponseHTTP alloc] init];
    [self.responseObject setRequestURL:request];
    self.requestObject = request;
    
    return self;
}

@end
