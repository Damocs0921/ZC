//
//  TableViewDevider.m
//  JJJR
//
//  Created by DamocsYang on 5/25/15.
//  Copyright (c) 2015 fengzeyan. All rights reserved.
//

#import "TableViewDevider.h"
#import "Config.h"

@implementation TableViewDevider

+(UIView*)getNoTopLineView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,20)];
    view.backgroundColor = BACKGROUND_COLOR;
    
    UIView *btLine = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - LINE_HEIGHT, ScreenWidth, LINE_HEIGHT)];
    btLine.backgroundColor = DEVIDE_LINE_COLOR;
    [view addSubview:btLine];
    
    return view;
}
+(UIView*)getHeaderView:(BOOL)isLine
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,20)];
    view.backgroundColor = BACKGROUND_COLOR;
    UIView *tpLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, LINE_HEIGHT)];
    tpLine.backgroundColor = DEVIDE_LINE_COLOR;
    [view addSubview:tpLine];
    if(!isLine)
    {   UIView *btLine = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - LINE_HEIGHT, ScreenWidth, LINE_HEIGHT)];
        btLine.backgroundColor = DEVIDE_LINE_COLOR;
        [view addSubview:btLine];
    }
    return view;
}

+(UIView*)getHighHeaderWithString:(NSString*)str hasTopLine:(BOOL)tpLine
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,40)];
    view.backgroundColor = BACKGROUND_COLOR;
    if (tpLine)
    {
        UIView *tpLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, LINE_HEIGHT)];
        tpLine.backgroundColor = DEVIDE_LINE_COLOR;
        [view addSubview:tpLine];
    }
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, ScreenWidth - 20,20)];
    label.text = str;
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:15.0f];
    [view addSubview:label];
    UIView *btLine = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - LINE_HEIGHT, ScreenWidth, LINE_HEIGHT)];
    btLine.backgroundColor = DEVIDE_LINE_COLOR;
    [view addSubview:btLine];
    
    return view;
}

+(UIView*)singleLine
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,LINE_HEIGHT)];
    view.backgroundColor = DEVIDE_LINE_COLOR;
    
    return view;
}

+(UIView*)getFooterView
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, LINE_HEIGHT)];
    footView.backgroundColor = BACKGROUND_COLOR;
    UIView *tpLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, LINE_HEIGHT)];
    tpLine.backgroundColor = DEVIDE_LINE_COLOR;
    [footView addSubview:tpLine];
    
    return footView;
}

+(void)customDeviderOfTable:(UITableView*)tableView
{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
