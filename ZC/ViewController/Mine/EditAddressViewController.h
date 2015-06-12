//
//  EditAddressViewController.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressDto.h"

#define NOTIFICATION_EDIT_ADDR @"NotificationEditAddress"

@interface EditAddressViewController : BaseViewController

-(id)initWithAddress:(AddressDto*)address;

@end
