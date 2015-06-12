//
//  AddressListViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"

@interface AddressListViewModel : BaseViewModel

@property(readonly,nonatomic,retain)NSMutableArray* addressesArray;

-(void)loadAddressesArray:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
