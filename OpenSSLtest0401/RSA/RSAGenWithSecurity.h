//
//  RSAGenWithSecurity.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/05.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSAGenWithSecurity : NSObject

-(NSString *)JWTEncodeHS;
-(void)ParseJWT;

@end

NS_ASSUME_NONNULL_END
