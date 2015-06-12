//
//  RewardDto.h
//  ZC
//
//  Created by DamocsYang on 6/11/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface RewardDto : NSObject

@property(copy,nonatomic)NSString* projectId;
@property(copy,nonatomic)NSString* rewardId;
@property(copy,nonatomic)NSString* content;
@property(copy,nonatomic)NSString* sendTime;
@property(copy,nonatomic)NSString* thumb;
@property(assign,nonatomic)CGFloat price;
@property(assign,nonatomic)NSInteger limit;
@property(assign,nonatomic)NSInteger supporter;

@end
