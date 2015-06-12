//
//  MainServiceCell.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ServiceTextDelegate <NSObject>

-(void)onServiceClicked:(NSInteger)type;

@end


@interface MainServiceCell : UITableViewCell
@property(assign,nonatomic) id<ServiceTextDelegate> serviceDelegate;
@end
