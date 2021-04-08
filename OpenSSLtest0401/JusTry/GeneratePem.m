//
//  GeneratePem.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/08.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "GeneratePem.h"

typedef void(^byteFromBlock)(NSString*);

@implementation GeneratePem

byteFromBlock toBlock = ^(NSString *str)
{
    NSLog(@"%@", str);
};

-(void)blockProperty
{
//    byteFromBlock toBlock = ^(NSString *str)
//    {
//        NSLog(@"%@", str);
//    };
    
    toBlock(@"hello");
}

//block 내부에서나, 외부에서나 선언 가능. block함수 중괄호로 끝낼때는 ;

NSData *bytesFromHexString(NSString *aString)
{
    NSString *str = [[aString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:nil];
    //componentsSeparatedByCharactersInSet 함수는 python에서 split과 같다. 뒤에 붙은 옵션은 whitespace(' ') 띄어진 부분을 기준으로 split한다.
    
    NSMutableData *data = [NSMutableData data];
    
    int idx;
    for(idx = 0; idx+2 <= [str length]; idx += 2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString *hexStr = [str substringWithRange: range];
        NSScanner *scanner = [NSScanner scannerWithString: hexStr];
        
        unsigned int intValue;
        
        if([scanner scanHexInt:&intValue]) {
            [data appendBytes:&intValue length:1];
        }
    }
    
    return data;
}

#pragma mark - 함수

-(NSData *)lengthStorageData
{
    static uint8_t zero[] = {0x00};
    NSMutableData *zeroByteData = [[NSMutableData alloc] init];
    [zeroByteData appendBytes:zero length:1];
    
    return zeroByteData;
}

-(void)raiseUnimplemented
{
    [NSException raise:@"Invalid BER translation" format:@"uniplemented for this type"];
}

-(uint8_t *)berTag
{
    [self raiseUnimplemented];
    return nil;
}

-(NSData *)berContent
{
    [self raiseUnimplemented];
    return nil;
}

-(NSData *)berData
{
    NSMutableData *berData = [[NSMutableData alloc] init];
    
    NSMutableData *berHeader = [[NSMutableData alloc] init];

    [berHeader appendBytes:[self berTag] length:1];
    [berHeader appendData:[self lengthStorageData]];
    
    [berData appendData:berHeader];
    [berData appendData:[self berContent]];
    
    return berData;
}

#pragma mark - 구현부

//+(SecKeyRef)stringToRSAPublicKey:(NSString *)modulus andExponent:(NSString *)exponent
//{
//    NSData *base64Modulus = [[modulus dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
//    NSData *base64Exponent = [[exponent dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
//
//    if(base64Modulus == nil || base64Exponent == nil)
//        return nil;
//
//    NSMutableArray *testArray = [[NSMutableArray alloc] init];
//    const char *fixBytes = 0;
//
//    NSMutableData *fixedModulus = [NSMutableData dataWithBytes:&fixBytes length:1];
//    [fixedModulus appendData:base64Modulus];
//
//    [testArray addObject:fixedModulus];
//    [testArray addObject:base64Exponent];
//
//    return base64Modulus;
//}

@end
