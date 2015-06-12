//
//  NewsDto.h
//  ZC
//
//  Created by DamocsYang on 6/8/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDto : NSObject

@property(copy,nonatomic)NSString* objectId;
@property(copy,nonatomic)NSString* title;
@property(copy,nonatomic)NSString* abstract;
@property(copy,nonatomic)NSString* time;
@property(copy,nonatomic)NSString* url;

@end
