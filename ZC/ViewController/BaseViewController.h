//
//  BaseViewController.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Config.h"
#import "Masonry.h"
#import "StringUtil.h"

@interface BaseViewController : UIViewController

- (void)bindViewModel;
- (void)initUIView;
- (void)cancelWebRequest;


- (void)setBackButton:(BOOL)isShown;
- (void)goBack;


- (void)showWaiting;
- (void)hideWaiting;

- (void)showToast:(NSString*)str;

@end
