//
//  ZCAPPSingleton.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDto.h"

@interface ZCAPPSingleton : NSObject

@property(readonly, copy, nonatomic) NSString *deviceToken;
@property(readonly, copy, nonatomic) NSString *deviceType;
@property(readonly, copy, nonatomic) NSString *clientVersion;

+ (ZCAPPSingleton *)instance;

- (BOOL)hasLogin;

@property(nonatomic, strong) UserDto *currentUser;

@end
