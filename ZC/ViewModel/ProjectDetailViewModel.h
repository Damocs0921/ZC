//
//  ProjectDetailViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/11/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"
#import "ProjectDetail.h"

@interface ProjectDetailViewModel : BaseViewModel

@property(retain,nonatomic) ProjectDetail* projectDetail;

-(void)loadProjectDetail:(NSString*)orderId success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
