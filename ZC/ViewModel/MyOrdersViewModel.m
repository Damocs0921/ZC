//
//  MyOrdersViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MyOrdersViewModel.h"
#import "OrderDto.h"

@interface MyOrdersViewModel()
{
    BOOL _canLoadMore;
}
@end

@implementation MyOrdersViewModel

-(id)init
{
    if (self = [super init])
    {
        _ordersArray = [[NSMutableArray alloc]init];
        _canLoadMore = false;
    }
    
    return self;
}

-(void)loadOrdersArray:(BOOL)isRefresh success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"OrderDto"];
    
    [query orderByDescending:@"updatedAt"];
    [query whereKey:@"userId" equalTo:[ZCAPPSingleton instance].currentUser.userId];
    [query selectKeys:@[@"userId",@"title",@"thumb",@"price",@"state"]];
    
    query.limit = LIST_PAGE_SIZE;
    
    if (isRefresh)
    {
        query.skip = 0;
    }
    else
    {
        query.skip = [_ordersArray count];
    }
    
    //执行查询
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error)
     {
         if (error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             NSLog(@"array = %@",array);
             
             if (isRefresh)
             {
                 _canLoadMore = ([array count] >= LIST_PAGE_SIZE);
                 [_ordersArray removeAllObjects];
             }
             else
             {
                 _canLoadMore = ([array count] > 0);
             }
             
             
             for (BmobObject* obj in array)
             {
                 OrderDto* dto = [[OrderDto alloc]init];
                 
                 dto.orderId = obj.objectId;
                 dto.userId = [obj objectForKey:@"userId"];
                 dto.title = [obj objectForKey:@"title"];
                 dto.thumb = [obj objectForKey:@"thumb"];
                 dto.price = [[obj objectForKey:@"price"] floatValue];
                 dto.state = [[obj objectForKey:@"state"] integerValue];
                 [_ordersArray addObject:dto];
             }
             
             success(true);
         }
     }];
}

-(BOOL)canLoadMore
{
    return _canLoadMore;
}

@end
