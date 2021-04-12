//
//  RequestManager.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/09.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RequestHTTP.h"
#import "ResponseHTTP.h"

@interface RequestManager : NSObject

@property (nonatomic, strong) NSMutableArray *arrRequest;

-(void)log;

@end
