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

@property (atomic, strong) NSOperationQueue *operationQueue;

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
-(id)init
{
    self = [super init];
    if (self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        [self.operationQueue setMaxConcurrentOperationCount:10];
        self.arrRequests = [[NSMutableArray alloc] initWithCapacity:1];
    }
    
    return self;
}

-(void)dealloc
{
    self.operationQueue = nil;
    self.arrRequests = nil;
}


#pragma mark -
-(void)sendRequestData:(NetworkRequestHTTP *)inRequest inResponse:(networkResponseBlock)responseHandeler
{
    NSMutableDictionary *pDic = nil;
    
    NetworkConnectionHTTP *pConnection = nil;
    
    for(pDic in self.arrRequests) {
        pConnection = [pDic objectForKey:@"NET_CONNECTION"];
        if (pConnection != nil && [pConnection.networkRequest.requestID isEqualToString:inRequest.requestID]) {
            return;
        }
    }
    
    [inRequest requestBody];
    [inRequest.urlRequest setHTTPShouldHandleCookies:NO];
    
    pConnection = [[NetworkConnectionHTTP alloc] initWithRequest:inRequest delegate:networkManager startImmediately:NO];
    pConnection.networkResponse.blockResponse = responseHandeler;
    [pConnection  setDelegateQueue:networkManager.operationQueue];
    
    pDic = [NSMutableDictionary dictionaryWithCapacity:1];
    [pDic setObject:pConnection forKey:@"NET_CONNECTION"];
    [self.arrRequests addObject:pDic];
    
    NSLog(@"URL: %@", inRequest.urlRequest.URL);
    NSDictionary *dicAllHTTPHeaderField = [inRequest.urlRequest allHTTPHeaderFields];
    NSLog(@"all Header Field: %@", dicAllHTTPHeaderField);
    
    NSData *dataHTTPBody = [inRequest.urlRequest HTTPBody];
    if(nil != dataHTTPBody) {
        NSString *strHTTPBody = [[NSString alloc] initWithData:dataHTTPBody encoding:NSUTF8StringEncoding];
        NSLog(@"HTTP Body: %@", strHTTPBody);
    }
    
    [pConnection start];
}

@end
