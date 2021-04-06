//
//  RSAGenerateKey.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/01.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RSAGenerateKey.h"

#include <openssl/rsa.h>
#include <openssl/evp.h>
#include <openssl/bn.h>
#include <openssl/pem.h>

@implementation RSAGenerateKey

-(NSString *)performRSADecryptionForData:(NSString *)atData andModulus:(NSString *)mod andExponent:(NSString *)exp
{
    RSA *publicKey = RSA_new();
    BIGNUM *modulus = BN_new();
    BIGNUM *exponent = BN_new();
    
    NSMutableString *hexMod = [mod mutableCopy];
    NSMutableString *hexExp = [exp mutableCopy];
    
    BN_hex2bn(&modulus, [hexMod UTF8String]);
    BN_hex2bn(&exponent, [hexExp UTF8String]);
    
    publicKey->n = modulus;
    publicKey->e = exponent;
    
    //modulus와 exponent를 이용한 public key 생성.
    
    NSString *str = @"str";
    
    return str;
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

