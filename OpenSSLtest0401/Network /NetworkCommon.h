//
//  NetworkCommon.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/14.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkManagerHTTP.h"
#import "NetworkCommon.h"

@interface NetworkCommon : NSObject

+(void)cancelAllRequest;
+(void)cancelRequestWithID:(NSString *)requestID;

//+(NSString *)getAuthRequestWithResponse:(netw)


@end
