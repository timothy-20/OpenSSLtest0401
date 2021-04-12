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

typedef NS_ENUM(int, netResponseType) {
    typeSuccesss,
    typeFail,
    typeError,
    typeNoData
};

typedef void(^networkResponseBlock)(ResponseHTTP *response, netResponseType status);

@interface ResponseHTTP : NSObject

@property (nonatomic, strong) RequestHTTP *requestURL;

@property (nonatomic, strong) NSHTTPURLResponse *responseURL;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableDictionary *responseDic;
@property (nonatomic, strong) networkResponseBlock blockResponse;
@property (nonatomic, strong) NSError *error;

-(NSDictionary *)headerResponse;
-(NSMutableDictionary *)responseAuth;
-(int)statusCode;

-(void)addResponseData:(NSData *)addData;

@end
