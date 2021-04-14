//
//  NetworkResponseHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkResponseHTTP.h"

#define URL_PARAMETER @"http://qc.aircuve.com:10080/provision?akData=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhayIsImRhdGEiOiJwMWNCb0VNeHBRY2N0cHhaTXBRYyIsImV4cCI6MTYxNzAwMTI3MiwiaWF0IjoxNjE3MDAwNjcyfQ.eG8U_PU5F20XyGfz0V-RFGqDkgexwQcsGH4tgSKWA4hSQ4oCM7p4Hiyj-o0ZpYyPHibvbrXxntHoT1DdcuTrWhmk3A8hC4VTcdYMPjekis_pgc6Sxmgbz-_6OXbtS2H5DRl-mHd3PbaVU1pNLg2tBMHeXYSZ-IuvmJW4Rz5qiNQ&publicKeyModulus=c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b&publicKeyExponent=10001&ipAddress=10.10.20.51"

@implementation NetworkResponseHTTP

-(void)dealloc
{
    self.akData = nil;
    self.publicKeyModulus = nil;
    self.publicKeyExponent = nil;
    self.ipAddress = nil;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        NSString *receiveURL = [NSString stringWithFormat:@"%@", URL_PARAMETER];
        NSArray *segment = [receiveURL componentsSeparatedByString:@"?"];
        NSArray *parameters = [segment[1] componentsSeparatedByString:@"&"];
        NSMutableDictionary *paramsDataDic = [NSMutableDictionary dictionary];
        
        for (int i = 0; i < parameters.count; i++) {
            NSArray *paramsArray = [NSArray array];

            paramsArray = [parameters[i] componentsSeparatedByString:@"="];
            
            [paramsDataDic setObject:paramsArray[1] forKey:paramsArray[0]];
        }
        
        self.akData = [paramsDataDic valueForKey:@"akData"];
        self.publicKeyModulus = [paramsDataDic valueForKey:@"publicKeyModulus"];
        self.publicKeyExponent = [paramsDataDic valueForKey:@"publicKeyExponent"];
        self.ipAddress = [paramsDataDic valueForKey:@"ipAddress"];
//        데이터 값의 파라미터 분리
    }
    
    return self;
}


@end
