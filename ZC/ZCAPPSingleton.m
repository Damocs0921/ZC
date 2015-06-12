//
//  ZCAPPSingleton.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ZCAPPSingleton.h"

@implementation ZCAPPSingleton

+ (ZCAPPSingleton *)instance
{
    static ZCAPPSingleton *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ZCAPPSingleton alloc] init];
    });
    return _instance;
}

- (NSString *)clientVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)deviceToken
{
    return @"";
}

- (NSString *)deviceType
{
    return @"1";
}

- (BOOL)hasLogin
{
    return self.currentUser != nil;
}

-(UserDto*)currentUser
{
    UserDto* dto = [[UserDto alloc]init];
    dto.userId = @"100001";
    dto.phoneNumber = @"13600887234";
    dto.nickName = @"小刀";
    
    return dto;
}

@end
