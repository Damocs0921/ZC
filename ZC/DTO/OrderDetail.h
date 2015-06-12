//
//  OrderDetail.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "OrderDto.h"

@interface OrderDetail : OrderDto

@property(copy,nonatomic)NSString* orderTime;
@property(copy,nonatomic)NSString* orderNote;
//外键
@property(copy,nonatomic)NSString* addressId;
@property(copy,nonatomic)NSString* sponsorId;
@property(copy,nonatomic)NSString* rewardId;

@end
