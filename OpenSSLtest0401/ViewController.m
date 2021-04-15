//
//  ViewController.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/01.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "ViewController.h"
#import "NetworkCommon.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSString *tokenString = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhayIsImRhdGEiOiJwMWNCb0VNeHBRY2N0cHhaTXBRYyIsImV4cCI6MTYxNzAwMTI3MiwiaWF0IjoxNjE3MDAwNjcyfQ.eG8U_PU5F20XyGfz0V-RFGqDkgexwQcsGH4tgSKWA4hSQ4oCM7p4Hiyj-o0ZpYyPHibvbrXxntHoT1DdcuTrWhmk3A8hC4VTcdYMPjekis_pgc6Sxmgbz-_6OXbtS2H5DRl-mHd3PbaVU1pNLg2tBMHeXYSZ-IuvmJW4Rz5qiNQ";
//    NSString *modulusString = @"c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b";
//    NSString *exponentString = @"10001";
    
    //테스트용 값
    
//    NetworkResponseHTTP *response = [[NetworkResponseHTTP alloc] init];
//
//    NSLog(@"akData: %@", [response akData]);
//    NSLog(@"modulusData: %@", [response publicKeyModulus]);
//    NSLog(@"exponentData: %@", [response publicKeyExponent]);
    
    [self requestPush];
}

-(void)requestPush
{
    [NetworkCommon getAuthRequestWithResponse:^(NetworkResponseHTTP *response, eNET_RES_TYPE status){
        NSArray *dicObject = [response.responseDictionary allValues];
        NSArray *dicKey = [response.responseDictionary allKeys];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        NSLog(@"success");
    }];
}


@end
