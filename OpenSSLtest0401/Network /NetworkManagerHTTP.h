//
//  NetworkManagerHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkRequestHTTP.h"
#import "NetworkResponseHTTP.h"

@interface NetworkManagerHTTP : NSObject

@property (nonatomic, strong) NSMutableArray *arrRequests;

+(NetworkManagerHTTP *)getInstance;

+(void)request:(NetworkRequestHTTP *)inRequest inResponse:(networkResponseBlock)responseHandler;
//+(void)canecelRequest:(NetworkRequestHTTP *)inRequest;
//+(void)cancelRequestWithRequestID:(NSString *)inRequestID;
//+(void)cancelAllRequest;


@end
