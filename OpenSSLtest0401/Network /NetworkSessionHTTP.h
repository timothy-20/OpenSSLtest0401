//
//  NetworkSessionHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/15.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkRequestHTTP;
@class NetworkResponseHTTP;

@interface NetworkSessionHTTP : NSObject

@property (nonatomic, strong) NetworkRequestHTTP *netRequest;
@property (nonatomic, strong) NetworkResponseHTTP *netResponse;

@end
