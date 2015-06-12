//
//  OrderDetailViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"
#import "OrderDetail.h"
#import "AddressDto.h"
#import "SponsorDto.h"
#import "RewardDto.h"


@interface OrderDetailViewModel : BaseViewModel

@property(retain,nonatomic)OrderDetail* orderDetail;
@property(retain,nonatomic)AddressDto* address;
@property(retain,nonatomic)SponsorDto* sponsor;
@property(retain,nonatomic)RewardDto* reward;

-(void)loadOrderDetail:(NSString*)orderId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

-(void)loadAddress:(NSString*)addressId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

-(void)loadSponsor:(NSString*)sponsorId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

-(void)loadReward:(NSString*)sponsorId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
