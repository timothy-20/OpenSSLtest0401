//
//  TokenParser.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "TokenParser.h"
#import "NetworkResponseHTTP.h"

@implementation TokenParser

-(void)dealloc
{
    self.activationKey = nil;
}

-(id)initWithToken:(NSString *)tokenStr
{
    self = [super init];
    
    if (self) {
        NSArray *segments = [tokenStr componentsSeparatedByString:@"."];
        NSString *payload = [segments objectAtIndex:1];
        
        int reqLength = (int)(4 * ceil((float)[payload length] / 4.0));
        int nbrPadding = reqLength - [payload length];
        
        if (nbrPadding > 0) {
            NSString *padding = [[NSString string] stringByPaddingToLength:nbrPadding withString:@"=" startingAtIndex:0];
            payload = [payload stringByAppendingString:padding];
        }
        
        payload = [payload stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
        payload = [payload stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
        
        NSData *payloadData = [[NSData alloc] initWithBase64EncodedString:payload options:0];
//        NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
//        jwt의 payload 추출.
        
        NSDictionary *payloadWithJson = [NSJSONSerialization JSONObjectWithData:payloadData options:0 error:nil];
        
        self.activationKey = [payloadWithJson valueForKey:@"data"];
    }
    
    return self;
}

+(TokenParser *)sendActivationKey
{
    NetworkResponseHTTP *receiveParam = [[NetworkResponseHTTP alloc] init];
    
    return [[TokenParser alloc] initWithToken:[receiveParam akData]];
}

@end
