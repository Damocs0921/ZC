//
//  PayViewController.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewController.h"

@interface PayViewController : BaseViewController
-(id)initWithOrder:(NSString*)orderId address:(NSString*)address;
@end
