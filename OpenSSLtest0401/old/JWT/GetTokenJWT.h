//
//  GetTokenJWT.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/07.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetTokenJWT : NSObject

+(GetTokenJWT *)XAuthToken;

@property (nonatomic, strong) NSString *tokenResult;

@end