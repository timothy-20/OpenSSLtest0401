//
//  RequestHTTP.h
//  OpenSSLtest0401
//
//  Created by 임정운 on 2021/04/06.
//  Copyright © 2021 임정운. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RequestHTTP : NSObject

-(void)requestAuth;
@property (nonatomic, strong) NSMutableURLRequest *request;

@end

@interface NSString (JSONAddtions)
+(NSString *)dictionaryToJson:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
