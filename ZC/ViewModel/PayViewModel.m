//
//  PayViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "PayViewModel.h"

@implementation PayViewModel

-(void)getAmountOfOrder:(NSString*)orderId success:(void (^)(CGFloat amount))success failure:(void (^)(NSString* error))failure
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
                CGFloat amount = [[obj objectForKey:@"price"] floatValue];
                success(amount);
             }
             else
             {
                 failure(@"找不到该订单");
             }
         }
     }];
}

@end
