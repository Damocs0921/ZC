//
//  TableViewDevider.h
//  JJJR
//
//  Created by DamocsYang on 5/25/15.
//  Copyright (c) 2015 fengzeyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewDevider : NSObject

+(UIView*)getNoTopLineView;

+(UIView*)getHeaderView:(BOOL)isLine;

+(UIView*)getHighHeaderWithString:(NSString*)str hasTopLine:(BOOL)tpLine;

+(UIView*)getFooterView;

+(UIView*)singleLine;

+(void)customDeviderOfTable:(UITableView*)tableView;

@end
