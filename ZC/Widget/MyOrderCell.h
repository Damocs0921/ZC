//
//  MyOrderCell.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDto.h"

@interface MyOrderCell : UITableViewCell
-(void)setData:(OrderDto*)data;
@end
