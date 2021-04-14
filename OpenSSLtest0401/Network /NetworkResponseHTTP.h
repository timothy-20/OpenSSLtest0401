//
//  NetworkResponseHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#define URL_PARAMETER @"http://qc.aircuve.com:10080/provision?akData=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhayIsImRhdGEiOiJwMWNCb0VNeHBRY2N0cHhaTXBRYyIsImV4cCI6MTYxNzAwMTI3MiwiaWF0IjoxNjE3MDAwNjcyfQ.eG8U_PU5F20XyGfz0V-RFGqDkgexwQcsGH4tgSKWA4hSQ4oCM7p4Hiyj-o0ZpYyPHibvbrXxntHoT1DdcuTrWhmk3A8hC4VTcdYMPjekis_pgc6Sxmgbz-_6OXbtS2H5DRl-mHd3PbaVU1pNLg2tBMHeXYSZ-IuvmJW4Rz5qiNQ&publicKeyModulus=c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b&publicKeyExponent=10001&ipAddress=10.10.20.51"

@class NetworkRequestHTTP;
@class NetworkResponseHTTP;

typedef NS_ENUM(int, eNET_RES_TYPE)
{
    eNET_RES_TYPE_SUCCESS,
    eNET_RES_TYPE_FAIL,
    eNET_RES_TYPE_CANCEL,
    eNET_RES_TYPE_ERROR,
    eNET_RES_TYPE_EXPIRE_LOGIN,
    eNET_RES_TYPE_NO_DATA
};

typedef void(^networkResponseBlock)(NetworkResponseHTTP *response, eNET_RES_TYPE status);

@interface NetworkResponseHTTP : NSObject
@property (nonatomic, strong) NSString *akData;
@property (nonatomic, strong) NSString *publicKeyModulus;
@property (nonatomic, strong) NSString *publicKeyExponent;
@property (nonatomic, strong) NSString *ipAddress;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableDictionary *responseDictionary;

@property (nonatomic, strong) NSError *error;

@property (nonatomic, strong) NSHTTPURLResponse *responseURL;
@property (nonatomic, strong) NetworkRequestHTTP *networkRequest;
@property (nonatomic, strong) NSDictionary *headerResponse;
@property (nonatomic, strong) networkResponseBlock blockResponse;

@end
