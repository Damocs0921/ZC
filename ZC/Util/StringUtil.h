//
//  StringUtil.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject

+ (BOOL)isNullOrEmpty:(NSString *)str;

+ (NSString *)trimSpacesOfString:(NSString *)str;

+ (NSString *)stringFromDate:(NSDate *)date;

@end
