//
//  RSAEncode.m
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import "RSAEncode.h"

#import <Security/Security.h>

@implementation RSAEncode

NSData *publicTag;
NSData *privateTag;

SecKeyRef publicKey = NULL;
SecKeyRef privateKey = NULL;

-(void)generateKeyPair:(NSUInteger)keySize
{
    OSStatus sanityCheck = noErr;
    
    NSMutableDictionary *keyPairAttr = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary *publicKeyAttr = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *privateKeyAttr = [[NSMutableDictionary alloc] init];
    
    [keyPairAttr setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [keyPairAttr setObject:[NSNumber numberWithUnsignedInteger:keySize] forKey:(__bridge id)kSecAttrKeySizeInBits];
    
    [publicKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [publicKeyAttr setObject:publicTag forKey:(__bridge id)kSecAttrApplicationTag];
    
    [privateKeyAttr setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecAttrIsPermanent];
    [privateKeyAttr setObject:privateTag forKey:(__bridge id)kSecAttrApplicationTag];
    
    [keyPairAttr setObject:privateKeyAttr forKey:(__bridge id)kSecPrivateKeyAttrs];
    [keyPairAttr setObject:publicKeyAttr forKey:(__bridge id)kSecPublicKeyAttrs];
    
    sanityCheck = SecKeyGeneratePair((__bridge CFDictionaryRef)keyPairAttr, &publicKey, &privateKey);
    
    if (sanityCheck == noErr && publicKey != NULL && privateKey != NULL) {
        NSLog(@"Succese");
    }
}

-(SecKeyRef)getPublicKeyRef
{
    OSStatus sanityCheck = noErr;
    SecKeyRef publicKeyReference = NULL;
    
    if(publicKeyReference == NULL) {
        [self generateKeyPair:512];
        
        NSMutableDictionary *queryPublicKey = [[NSMutableDictionary alloc] init];
        
        [queryPublicKey setObject:(__bridge id)kSecClassKey forKey:(__bridge id)kSecClassKey];
        [queryPublicKey setObject:publicTag forKey:(__bridge id)kSecAttrApplicationTag];
        [queryPublicKey setObject:(__bridge id)kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
        [queryPublicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
        
        sanityCheck = SecItemCopyMatching((__bridge CFDictionaryRef)queryPublicKey, (CFTypeRef *)&publicKeyReference);
    } if (sanityCheck != noErr) {
        publicKeyReference = NULL;
    } else {
        publicKeyReference = publicKey;
    }
    
    return publicKeyReference;
}

-(void)encryptWithPublicKey:(uint8_t *)plainBuffer cipherBuffer:(uint8_t *)cipherBuffer
{
    NSLog(@"== encryptWithPublicKey()");
    OSStatus status = noErr;
    NSLog(@"** original plain text 0: %s", plainBuffer);
    
    size_t plainBufferSize = strlen((char *)plainBuffer);
    size_t cipherBufferSize = 1024;
    
//    NSLog(@"SecKeyGetBlockSize() public = %lu", SecKeyGetBlockSize([self ]))
}

@end
