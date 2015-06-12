//
//  AddressListViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "AddressListViewModel.h"
#import "AddressDto.h"

@implementation AddressListViewModel

-(id)init
{
    if (self = [super init])
    {
        _addressesArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)loadAddressesArray:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobQuery *query = [BmobQuery queryWithClassName:@"AddressDto"];
    
    [query orderByDescending:@"updatedAt"];
    [query whereKey:@"userId" equalTo:[ZCAPPSingleton instance].currentUser.userId];
    
    query.limit = 10;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error)
     {
         if (error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             [_addressesArray removeAllObjects];
             
             for (BmobObject* obj in array)
             {
                 AddressDto* dto = [[AddressDto alloc]init];
                 dto.name = [obj objectForKey:@"name"];
                 dto.phone = [obj objectForKey:@"phone"];
                 dto.province = [obj objectForKey:@"province"];
                 dto.city = [obj objectForKey:@"city"];
                 dto.detail = [obj objectForKey:@"detail"];
                 dto.objectId = obj.objectId;
                 [_addressesArray addObject:dto];
             }
             
             success(true);
         }
     }];
    
}



@end
