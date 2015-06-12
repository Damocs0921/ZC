//
//  AddressCell.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressDto.h"

@interface AddressCell : UITableViewCell
-(void)setData:(AddressDto*)data;
@end
