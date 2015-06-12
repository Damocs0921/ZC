//
//  NewsCell.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDto.h"

@interface NewsCell : UITableViewCell

-(void)setData:(NewsDto*)data;

@end
