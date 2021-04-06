//
//  RSAGenerateKey.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/01.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <openssl/opensslv.h>
#include <openssl/evp.h>
#include <openssl/bn.h>
#include <openssl/rsa.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSAGenerateKey : NSObject

-(NSString *)performRSADecryptionForData:(NSString *)atData andModulus:(NSString *)mod andExponent:(NSString *)exp;

@end

NS_ASSUME_NONNULL_END
