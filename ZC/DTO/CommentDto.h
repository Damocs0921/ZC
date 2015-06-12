//
//  CommentDto.h
//  ZC
//
//  Created by DamocsYang on 6/11/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentDto : NSObject

@property(copy,nonatomic)NSString* commentId;
@property(copy,nonatomic)NSString* projectId;
@property(copy,nonatomic)NSString* userId;
@property(copy,nonatomic)NSString* content;

@property(copy,nonatomic)NSString* superCommentId;
@property(retain,nonatomic)NSArray* subCommentsIds;

@end
