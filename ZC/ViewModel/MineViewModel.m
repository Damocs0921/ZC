//
//  MineViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MineViewModel.h"

@implementation MineViewModel


- (UserDto*)user
{
   return [ZCAPPSingleton instance].currentUser;
}

- (NSString*)intro
{
   return @"公司简介简介简介";
}
@end
