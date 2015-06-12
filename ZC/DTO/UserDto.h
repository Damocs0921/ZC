//
//  UserDto.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface UserDto : NSObject

@property(copy,nonatomic) NSString* userId;
@property(copy,nonatomic) NSString* phoneNumber;
@property(copy,nonatomic) NSString* nickName;
@property(copy,nonatomic) NSString* avatarUrl;
@property(assign,nonatomic) CGFloat   accountBalance;
@property(assign,nonatomic) NSInteger numCollections;

@end
