//
//  NetworkRequestHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkRequestHTTP : NSObject
@property (nonatomic, strong) NSMutableDictionary *requestData;
@property (nonatomic, strong) NSString *requestID;
@property (nonatomic, strong) NSURLRequest *urlRequest;

@end
