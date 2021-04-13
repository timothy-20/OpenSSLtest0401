//
//  RSAGenWithSecurity.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/05.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RSAGenWithSecurity.h"
#import <JWT/JWT.h>

@implementation RSAGenWithSecurity

//-(NSString *)testReturn
//{
//    NSString *str = @"test";
//    return str;
//}

-(NSString *)JWTEncodeHS
{
//    NSString *takeStr = [self testReturn];
//    NSLog(@"%@", takeStr);
    
//    NSString *jwtToken = @"";
//    NSString *secret = @"";
//    NSString *algorithmName = @"RS256";
//
//    NSDictionary *payload = [JWTBuilder decodeMessage:jwtToken].secret(secret).algorithmName(algorithmName).decode;
    
    JWTClaimsSet *claimSet = [[JWTClaimsSet alloc] init];
    
    claimSet.issuer = @"downtown";
    claimSet.subject = @"Token";
    claimSet.audience = @"https://jwt.io";
    
    NSString *sec = @"secret";
    NSString *algorithmName = @"HS384";
    NSDictionary *header = @{@"custom":@"value"};
    
    id<JWTAlgorithm> algorithm = [JWTAlgorithmFactory algorithmByName:algorithmName];
    
    JWTBuilder *encodeBuilder = [JWT encodeClaimsSet:claimSet];
    NSString *encodeRes = encodeBuilder.secret(sec).algorithm(algorithm).headers(header).encode;
    
    if(encodeBuilder.jwtError == nil) {
        NSLog(@"encode res: %@", encodeRes);
    } else {
        NSLog(@"encode failed, error: %@", encodeBuilder.jwtError);
    }
    
    return encodeRes;
}

-(NSString *)ParseJWT
{
    NSString *jwt = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhayIsImRhdGEiOiJwMWNCb0VNeHBRY2N0cHhaTXBRYyIsImV4cCI6MTYxNzAwMTI3MiwiaWF0IjoxNjE3MDAwNjcyfQ.eG8U_PU5F20XyGfz0V-RFGqDkgexwQcsGH4tgSKWA4hSQ4oCM7p4Hiyj-o0ZpYyPHibvbrXxntHoT1DdcuTrWhmk3A8hC4VTcdYMPjekis_pgc6Sxmgbz-_6OXbtS2H5DRl-mHd3PbaVU1pNLg2tBMHeXYSZ-IuvmJW4Rz5qiNQ";
    
//    NSString *jwt = [self JWTEncodeHS];

    NSArray *segments = [jwt componentsSeparatedByString:@"."];
    NSString *payload = [segments objectAtIndex: 1];
    
//    NSLog(@"payload: %@", base64String);
    
    int reqLength = (int)(4 * ceil((float)[payload length] / 4.0));
//    NSLog(@"%f", (float)[base64String length]);
    
    int nbrPadding = reqLength - [payload length];
    
    if(nbrPadding > 0) {
        NSString *padding = [[NSString string] stringByPaddingToLength:nbrPadding withString:@"=" startingAtIndex:0];
        payload = [payload stringByAppendingString:padding];
    }
    
    payload = [payload stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    payload = [payload stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:payload options:0];
    NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
//    NSLog(@"%@", decodeString);
//    jwt의 payload 추출 완료
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[decodeString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
//    NSLog(@"%@", jsonDic);
    
//    json데이터를 dictionary로 받음
    
    NSNumber *timeInterval = [jsonDic valueForKey:@"exp"];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[timeInterval integerValue]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:date2];
    
//    NSLog(@"Setting Format Date: %@", stringFromDate);
//    NSLog(@"Date: %@", date2);
    
//    만료시간 로그
    
    NSString *activationKey = [jsonDic valueForKey:@"data"];
    
    return activationKey;
}


@end
