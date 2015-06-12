//
//  AddressDto.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressDto : NSObject

@property (copy,nonatomic) NSString* objectId;
@property (copy,nonatomic) NSString* name;
@property (copy,nonatomic) NSString* phone;
@property (copy,nonatomic) NSString* province;
@property (copy,nonatomic) NSString* detail;
@property (copy,nonatomic) NSString* city;

@end
