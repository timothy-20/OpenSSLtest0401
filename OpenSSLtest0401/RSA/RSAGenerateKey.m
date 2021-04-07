//
//  RSAGenerateKey.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/01.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RSAGenerateKey.h"

#import "RSAGenWithSecurity.h"

#include <openssl/rsa.h>
#include <openssl/evp.h>
#include <openssl/bn.h>
#include <openssl/pem.h>

@implementation RSAGenerateKey

-(RSA *)GenKeyWithRSA
{
    //    [RSA performRSADecryptionForData:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhayIsImRhdGEiOiJwMWNCb0VNeHBRY2N0cHhaTXBRYyIsImV4cCI6MTYxNzAwMTI3MiwiaWF0IjoxNjE3MDAwNjcyfQ.eG8U_PU5F20XyGfz0V-RFGqDkgexwQcsGH4tgSKWA4hSQ4oCM7p4Hiyj-o0ZpYyPHibvbrXxntHoT1DdcuTrWhmk3A8hC4VTcdYMPjekis_pgc6Sxmgbz-_6OXbtS2H5DRl-mHd3PbaVU1pNLg2tBMHeXYSZ-IuvmJW4Rz5qiNQ" andModulus:@"c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b" andExponent:@"010001"];
    
    RSA *publicKey = RSA_new();
    BIGNUM *modulus = BN_new();
    BIGNUM *exponent = BN_new();
    
    NSString *mod = @"c109d8b86ee2c46965c399a70df07839fd9cb30c0dfef15c33fe06761349433208ce5c474b0fddf001c44ca6b25ac8e0f2470ea3d2b90a69b64cbb021b8ba7de4a02b6141f6c42c82be580d18d7932858ad963f1aea9e374b20846efbf472a0c8c9d5324030075a86a525744c63506e9084d2d3c0f8f0fa199c900ff17573a0b";
    NSString *exp = @"010001";
    
    NSMutableString *hexMod = [mod mutableCopy];
    NSMutableString *hexExp = [exp mutableCopy];
    
    BN_hex2bn(&modulus, [hexMod UTF8String]);
    BN_hex2bn(&exponent, [hexExp UTF8String]);
    
    publicKey->n = modulus;
    publicKey->e = exponent;
    
    return publicKey;
}

-(NSString *)hexWithData:(unsigned char *)data ofLength:(NSUInteger)len
{
    NSMutableString *tmp = [NSMutableString string];
    for (NSUInteger i = 0; i < len; i++) {
        [tmp appendFormat:@"%02x", data[i]];
    }

//    NSString *strData = [NSString stringWithUTF8String:(char *)data];
//    NSMutableString *newString = [[NSMutableString alloc] init];
//
//    for (int j = 0; j < len; j += 2) {
//        NSString *hexChar = [strData substringWithRange:NSMakeRange(j, 2)];
//
//        int value = 0;
//
//        sscanf([hexChar cStringUsingEncoding:NSASCIIStringEncoding], "%x", &value);
//        [newString appendFormat:@"%c", (char)value];
//    }
//
    return tmp;
}

typedef void(^blockTest)(int a, int b);


-(NSString *)EncryptionWithRSA
{
    RSAGenWithSecurity *akClass = [[RSAGenWithSecurity alloc] init];
    NSString *plainText = [akClass ParseJWT];
    const char *plain = [plainText UTF8String];
    
    RSA *publickey = [self GenKeyWithRSA];
    
    int rsa_length = RSA_size(publickey);
    unsigned char *crip[rsa_length];
    
    NSString *result = [[NSString alloc] init];
    
    int iRsaRet = RSA_public_encrypt(strlen(plain), (const unsigned char *)plain, (unsigned char *)crip, publickey, RSA_PKCS1_PADDING);
    
    if(iRsaRet <= 0) {
        NSLog(@"encrypt failed");
        result = @"";
    } else {
//        NSData *data = [NSData dataWithBytes:(const char*)crip length:rsa_length];
//        NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
        result = [self hexWithData:crip ofLength:rsa_length];
        
        NSLog(@"encrypt success_with hex: %@", result);
    }
    
    return result;
}


//-(NSString *)hexStringWithData:(unsigned char*)data ofLength:(NSUInteger)len
//{
//    NSMutableString *tmp = [NSMutableString string];
//
//    for (NSUInteger i = 0; i < len; i++) {
//        [tmp appendFormat:@"%c", data[i]];
//    }
//
//    return [NSString stringWithString:tmp];
//}

//-(NSString *)performRSADecryptionForData:(NSString *)atData andModulus:(NSString *)mod andExponent:(NSString *)exp
//{
//    const char *data = [atData UTF8String];
//
//    NSMutableString *hexMod = [mod mutableCopy];
//    NSMutableString *hexExp = [exp mutableCopy];
//
//    RSA *pubkey = RSA_new();
//    BIGNUM *modulus = BN_new();
//    BIGNUM *exponent = BN_new();
//
//    BN_hex2bn(&modulus, [hexMod UTF8String]);
//    BN_hex2bn(&exponent, [hexExp UTF8String]);
//
//    pubkey->n = modulus;
//    pubkey->e = exponent;
//
//    int rsa_length = RSA_size(pubkey);
//    unsigned char *crip[rsa_length];
//
//    NSString *s = [[NSString alloc] init];
//
//    unsigned long iRsaRet = RSA_public_decrypt(strlen(data), (const unsigned char *)data, (unsigned char *)crip, pubkey, RSA_NO_PADDING);
//
//    if(iRsaRet <= 0) {
//        NSLog(@"ERROR");
//
//        s = @"";
//    } else {
//        NSLog(@"%lu", sizeof(crip));
//
////        s = [self hexStringWithData:crip ofLength:rsa_length];
////        s = [NSString stringWithUTF8String:(char *)crip];
//        s = [NSString stringWithCString:(char *)crip encoding:NSUTF8StringEncoding];
//        NSLog(@"Decrypt_: %@", s);
//    }
//
//    return s;
//
//}

@end

