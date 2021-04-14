//
//  GenerateRSAKey.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "GenerateRSAKey.h"
#import "TokenParser.h"
#import "NetworkResponseHTTP.h"

#import <openssl/rsa.h>
#import <openssl/evp.h>
#import <openssl/bn.h>
#import <openssl/pem.h>

@implementation GenerateRSAKey

-(void)dealloc
{
    self.publicKeyRSA = nil;
}

-(id)initWithActivationKey:(NSString *)activationString inModulus:(NSString *)mod inExponent:(NSString  *)exp
{
    self = [super init];
    
    if(self) {
        const char *activationKey = [activationString UTF8String];
        RSA *publicKey = [self keyWithModulus:mod inExponent:exp];
        
        int iRsaLength = RSA_size(publicKey);
        unsigned char *crip[iRsaLength];
        
        self.publicKeyRSA = [[NSString alloc] init];
        
        int iRsaReturn = RSA_public_encrypt((int)strlen(activationKey), (const unsigned char *)activationKey, (unsigned char *)crip, publicKey, RSA_PKCS1_PADDING);
        
        if(iRsaReturn <= 0) {
            NSLog(@"Ocurred Error, due to generate publickey");
            self.publicKeyRSA = @"";
        } else {
            self.publicKeyRSA = [self hexWithData:(unsigned char *)crip ofLength:iRsaLength];
//            16진수 문자열로 전달.
        }
    }
    
    return self;
}

+(GenerateRSAKey *)sendPublicKey
{
    NetworkResponseHTTP *response = [[NetworkResponseHTTP alloc] init];
    
    TokenParser *token = [TokenParser sendActivationKey];
    NSString *activationKey = token.activationKey;
    
    return [[GenerateRSAKey alloc] initWithActivationKey:activationKey inModulus:[response publicKeyModulus] inExponent:[response publicKeyExponent]];
}

-(NSString *)hexWithData:(unsigned char *)data ofLength:(NSUInteger)length
{
    NSMutableString *tmp = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 0; i < length; i++) {
        [tmp appendFormat:@"%02x", data[i]];
    }
    
    return tmp;
}

-(RSA *)keyWithModulus:(NSString *)mod inExponent:(NSString *)exp
{
    RSA *publicKey = RSA_new();
    BIGNUM *modulus = BN_new();
    BIGNUM *exponent = BN_new();
    
    NSMutableString *hexModulus = [mod mutableCopy];
    NSMutableString *hexExponent = [exp mutableCopy];
    
    BN_hex2bn(&modulus, [hexModulus UTF8String]);
    BN_hex2bn(&exponent, [hexExponent UTF8String]);
    
    publicKey->n = modulus;
    publicKey->e = exponent;
    
    return publicKey;
}

@end
