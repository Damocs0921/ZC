//
//  ProjectDto.h
//  ZC
//
//  Created by DamocsYang on 6/8/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectDto : NSObject

@property(copy,nonatomic)NSString* objectId;
@property(copy,nonatomic)NSString* url;
@property(assign,nonatomic)NSInteger hasReached;
@property(assign,nonatomic)NSInteger hasCollected;
@property(assign,nonatomic)NSInteger daysLeft;

@end
