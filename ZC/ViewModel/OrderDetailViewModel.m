//
//  OrderDetailViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "OrderDetailViewModel.h"

@implementation OrderDetailViewModel

-(id)init
{
    if (self = [super init] )
    {
        _orderDetail = [[OrderDetail alloc]init];
        _address = [[AddressDto alloc]init];
        _sponsor = [[SponsorDto alloc]init];
        _reward = [[RewardDto alloc]init];
    }

    return self;
}

-(void)loadOrderDetail:(NSString*)orderId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobQuery *query = [BmobQuery queryWithClassName:@"OrderDto"];
    
    [query getObjectInBackgroundWithId:orderId block:^(BmobObject *obj, NSError *error)
    {
        if(error!=nil)
        {
            failure(error.localizedDescription);
        }
        else
        {
            if (obj!=nil)
            {
                _orderDetail.orderId = obj.objectId;
                _orderDetail.userId = [obj objectForKey:@"userId"];
                _orderDetail.title = [obj objectForKey:@"title"];
                _orderDetail.thumb = [obj objectForKey:@"thumb"];
                _orderDetail.price = [[obj objectForKey:@"price"] floatValue];
                _orderDetail.state = [[obj objectForKey:@"state"] integerValue];
                _orderDetail.rewardId = [obj objectForKey:@"rewardId"];
                _orderDetail.orderTime = [StringUtil stringFromDate:obj.createdAt];
                _orderDetail.orderNote = [obj objectForKey:@"orderNote"];
                _orderDetail.addressId = [obj objectForKey:@"addressId"];
                _orderDetail.sponsorId = [obj objectForKey:@"sponsorId"];
                
                success(true);
            }
            else
            {
                failure(@"找不到该订单");
            }
        }
        
    }];
}

-(void)loadAddress:(NSString*)addressId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobQuery *query = [BmobQuery queryWithClassName:@"AddressDto"];
    
    [query getObjectInBackgroundWithId:addressId block:^(BmobObject *obj, NSError *error)
     {
         if(error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             if (obj!=nil)
             {
                 _address.objectId = obj.objectId;
                 _address.name = [obj objectForKey:@"name"];
                 _address.phone = [obj objectForKey:@"name"];
                 _address.province = [obj objectForKey:@"province"];
                 _address.city = [obj objectForKey:@"city"];
                 _address.detail = [obj objectForKey:@"detail"];
                 
                 success(true);
             }
             else
             {
                 failure(nil);
             }
         }
     }];
}

-(void)loadSponsor:(NSString*)sponsorId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobQuery *query = [BmobQuery queryWithClassName:@"SponsorDto"];
    
    [query getObjectInBackgroundWithId:sponsorId block:^(BmobObject *obj, NSError *error)
     {
         if(error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             if (obj!=nil)
             {
                 _sponsor.sponsorId = obj.objectId;
                 _sponsor.name = [obj objectForKey:@"name"];
                 _sponsor.location = [obj objectForKey:@"location"];
                 _sponsor.briefIntro = [obj objectForKey:@"briefIntro"];
                 
                 success(true);
             }
             else
             {
                 failure(nil);
             }
         }
     }];
}

-(void)loadReward:(NSString*)sponsorId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobQuery *query = [BmobQuery queryWithClassName:@"RewardDto"];
    
    [query getObjectInBackgroundWithId:sponsorId block:^(BmobObject *obj, NSError *error)
     {
         if(error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             if (obj!=nil)
             {
                 _reward.rewardId = obj.objectId;
                 _reward.content = [obj objectForKey:@"content"];
                 _reward.sendTime = [obj objectForKey:@"sendTime"];
                 
                 success(true);
             }
             else
             {
                 failure(nil);
             }
         }
     }];


}

@end
