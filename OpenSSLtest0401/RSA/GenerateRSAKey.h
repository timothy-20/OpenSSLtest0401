//
//  GenerateRSAKey.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/13.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenerateRSAKey : NSObject

@property (nonatomic, strong) NSString *publicKeyRSA;

+(GenerateRSAKey *)sendPublicKey;

@end
