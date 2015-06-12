//
//  EditAddressViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "EditAddressViewModel.h"

@implementation EditAddressViewModel

-(void)addAddress:(AddressDto*)address success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobObject  *addr = [BmobObject objectWithClassName:@"AddressDto"];
    
    [addr setObject:address.name forKey:@"name"];
    [addr setObject:address.phone forKey:@"phone"];
    [addr setObject:address.province forKey:@"province"];
    [addr setObject:address.city forKey:@"city"];
    [addr setObject:address.detail forKey:@"detail"];
    [addr setObject:[ZCAPPSingleton instance].currentUser.userId forKey:@"userId"];
    

    [addr saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error)
     {
         if (isSuccessful)
         {
             NSLog(@"objectid :%@",addr.objectId);
             
             success(true);
             
         } else if (error)
         {
             failure(error.localizedDescription);
         } else
         {
             failure(@"添加失败");
         }
     }];
}


-(void)editAddress:(AddressDto*)address success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobObject *addr = [BmobObject objectWithoutDatatWithClassName:@"AddressDto"  objectId:address.objectId];
    
    [addr setObject:address.name forKey:@"name"];
    [addr setObject:address.phone forKey:@"phone"];
    [addr setObject:address.province forKey:@"province"];
    [addr setObject:address.city forKey:@"city"];
    [addr setObject:address.detail forKey:@"detail"];
    
    [addr updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error)
     {
        if (isSuccessful)
        {
            success(true);
            
        } else if (error)
        {
            failure(error.localizedDescription);
        } else
        {
            failure(@"修改失败");
        }
    }];
}



@end
