//
//  NetworkResponseHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "NetworkResponseHTTP.h"

@implementation NetworkResponseHTTP

-(void)dealloc
{
    self.akData = nil;
    self.publicKeyModulus = nil;
    self.publicKeyExponent = nil;
    self.ipAddress = nil;
    
    self.responseData = nil;
    self.responseDictionary = nil;
    self.responseURL = nil;
    self.error = nil;
    self.headerResponse = nil;
    self.networkRequest = nil;
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
//      url의 파라미터 분리
        
        self.responseData = nil;
        self.responseURL = nil;
        self.responseDictionary = nil;
        self.error = nil;
        self.headerResponse = nil;
        self.networkRequest = nil;
    }
    
    return self;
}

-(void)addResponseData:(NSData *)addData
{
    if(self.responseData == nil) {
        self.responseData = [[NSMutableData alloc] initWithCapacity:1];
    }
    
    [self.responseData appendData: addData];
}

-(int)statusCode
{
    NSInteger nStatusCode = [[self responseURL] statusCode];
    
    if(!(nStatusCode == 200)) {
        NSMutableDictionary *pDic = [NSMutableDictionary dictionaryWithCapacity:1];
        [pDic setValue:[NSString stringWithFormat:@"%d", (int)nStatusCode] forKey:@"HTTP_STATUS_CODE"];
        [pDic setValue:[NSHTTPURLResponse localizedStringForStatusCode:nStatusCode] forKey:@"HTTP_STATUS_DETAIL"];
        [pDic setValue:[[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding] forKey:@"RESPONSE_DATA"];
        
        self.error = [NSError errorWithDomain:@"ErrorDomain" code:nStatusCode userInfo:pDic];
    }
    
    return (int)nStatusCode;
}

-(NSDictionary *)headerResponse
{
    return [self.responseURL allHeaderFields];
}

-(NSMutableDictionary *)responseDictionary
{
    NSString *postData = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    [self statusCode];
    
    NSData *data = [postData dataUsingEncoding:NSUTF8StringEncoding];//??
    NSObject *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if([jsonObject isKindOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)jsonObject];
    } else if([jsonObject isKindOfClass:[NSArray class]]) {
        NSMutableDictionary *dicData = [NSMutableDictionary dictionary];
        [dicData setObject:jsonObject forKey:@"array"];
        
        return dicData;
    }
    
    return nil;
}










@end
