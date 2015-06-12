//
//  MineViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"
#import "UserDto.h"

@interface MineViewModel : BaseViewModel

@property(readonly,nonatomic,retain)UserDto* user;
@property(readonly,nonatomic,copy)  NSString* intro;

@end
