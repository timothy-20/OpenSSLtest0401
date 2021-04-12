//
//  ConnectionHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/12.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestHTTP;
@class ResponseHTTP;

@interface ConnectionHTTP : NSObject

@property(strong) RequestHTTP *requestObject;
@property(strong) ResponseHTTP *responseObject;

-(id)initWithRequest:(RequestHTTP *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately;

@end


