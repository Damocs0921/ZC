//
//  StringUtil.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil

+ (BOOL)isNullOrEmpty:(NSString *)str
{
    return (str == nil || [[StringUtil trimSpacesOfString:str] isEqualToString:@""]);
}

+ (NSString *)trimSpacesOfString:(NSString *)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

@end
