//
//  ResponseHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestHTTP;
@class ResponseHTTP;

NS_ASSUME_NONNULL_BEGIN

@interface ResponseHTTP : NSObject

@property (nonatomic, strong) RequestHTTP *requestURL;

@end

NS_ASSUME_NONNULL_END
