//
//  MainViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"

@interface MainViewModel : BaseViewModel

@property(readonly,nonatomic,retain)NSMutableArray* adsImageArray;
@property(readonly,nonatomic,retain)NSMutableArray* projectsArray;

-(void)loadProjectsArray:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
