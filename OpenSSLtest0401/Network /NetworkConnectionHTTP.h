//
//  NetworkConnectionHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/14.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkRequestHTTP;
@class NetworkResponseHTTP;

@interface NetworkConnectionHTTP : NSURLConnection

@property (atomic, strong) NSString *requestID;
@property (atomic, strong) NetworkRequestHTTP *networkRequest;
@property (atomic, strong) NetworkResponseHTTP *networkResponse;

//동기적 request를 위해 atomic으로 프로퍼티가 설정된다. 이는 생략해도 상관없다.

-(id)initWithRequest:(NetworkRequestHTTP *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately;

@end

