//
//  RequestManager.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/09.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestHTTP;
@class ResponseHTTP;

@interface RequestManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrRequest;

@property (nonatomic, strong) RequestHTTP *requestClass;
@property (nonatomic, strong) ResponseHTTP *responseClass;

-(void)sendRequestData;

@end
