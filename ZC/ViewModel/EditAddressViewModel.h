//
//  EditAddressViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"
#import "AddressDto.h"

@interface EditAddressViewModel : BaseViewModel

-(void)addAddress:(AddressDto*)address success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;


-(void)editAddress:(AddressDto*)address success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
