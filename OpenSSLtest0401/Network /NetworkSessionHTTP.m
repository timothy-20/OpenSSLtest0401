//
//  NetworkSessionHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/15.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkSessionHTTP.h"

#import "NetworkRequestHTTP.h"
#import "NetworkResponseHTTP.h"

@implementation NetworkSessionHTTP

-(void)dealloc
{
    self.netRequest = nil;
    self.netResponse = nil;
}

//-(id)initWithRequest:(NetworkRequestHTTP *)inRequest

@end
