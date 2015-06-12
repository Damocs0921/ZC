//
//  ZCRootViewController.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewController.h"

@interface ZCRootViewController : BaseViewController<UITabBarControllerDelegate>

- (void)setTabBarSelectedIndex:(NSInteger)selectIndex;

@end
