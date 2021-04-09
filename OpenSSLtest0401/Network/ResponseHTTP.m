//
//  ResponseHTTP.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "ResponseHTTP.h"

typedef NS_ENUM(int, netResponseType) {
    typeSuccesss,
    typeFail,
    typeError,
    typeNoData
};

typedef void(^networkResponseBlock)(ResponseHTTP *response, netResponseType status);

@implementation ResponseHTTP

-(int)statusCode
{
    NSInteger statusCode = [self.responseURL statusCode];
    
    if (statusCode == 200) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[NSString stringWithFormat:@"%d", (int)statusCode] forKey:@"HTTPStatusCode"];
        [dic setValue:[NSHTTPURLResponse localizedStringForStatusCode:statusCode] forKey:@"HTTPStatus"];
        [dic setValue:[[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding] forKey:@"HTTPResponseData"];
        
        self.error = [NSError errorWithDomain:@"NetErrorManager" code:statusCode userInfo:dic];
        //errorwithDomain은 에러발생 시, 어느 서버로 error 메시지를 전달할지를 기능하는 인자인 것 같다.
    }
    
    return (int)statusCode;
}

-(NSDictionary *)headerResponse
{
    return [self.responseURL allHeaderFields];
}

-(NSDictionary *)responseAuth
{
    NSString *postData = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    [self statusCode];
    
    NSData *data = [postData dataUsingEncoding:NSUTF8StringEncoding];
    NSObject *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if([jsonObject isKindOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:jsonObject];
    } else if([jsonObject isKindOfClass:[NSArray class]]){
        NSMutableDictionary *dicData = [NSMutableDictionary dictionary];
        [dicData setObject:dicData forKey:@"array"];
        
        return dicData;
    }
    
    return nil;
}

@end
