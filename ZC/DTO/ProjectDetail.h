//
//  ProjectDetail.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectDto.h"

@interface ProjectDetail : ProjectDto

@property(copy,nonatomic)  NSString* title;
@property(copy,nonatomic)  NSString* intro;
@property(assign,nonatomic)NSInteger usersPaid;
@property(assign,nonatomic)NSInteger usersPraised;


//外键
@property(copy,nonatomic)  NSString* sponsorId;

@end
