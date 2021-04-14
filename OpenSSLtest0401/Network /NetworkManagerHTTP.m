//
//  NetworkManagerHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkManagerHTTP.h"
#import "NetworkConnectionHTTP.h"

static dispatch_once_t onceToken;
static NetworkManagerHTTP *networkManager = nil;

@interface NetworkManagerHTTP ()

@property (atomic, strong) NSOperationQueue *queue;

@end

@implementation NetworkManagerHTTP

#pragma mark - class method

+(NetworkManagerHTTP *)getInstance
{
    dispatch_once(&onceToken, ^{
        networkManager = [[NetworkManagerHTTP  alloc] init];
    });
    
    return networkManager;
}

+(void)request:(NetworkRequestHTTP *)inRequest inResponse:(networkResponseBlock)responseHandler
{
    [[NetworkManagerHTTP getInstance] sendRequestData:inRequest inResponse:responseHandler];
}

#pragma mark - life cycle

#pragma mark -
-(void)sendRequestData:(NetworkRequestHTTP *)inRequest inResponse:(networkResponseBlock)responseHandeler
{
    NSMutableDictionary *pDic = nil;
    
    NetworkConnectionHTTP *pConnection = nil;
    
    for(pDic in self.arrRequests)
}

@end
