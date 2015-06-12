//
//  SponsorDto.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SponsorDto : NSObject

@property(copy,nonatomic)NSString* avatarUrl;
@property(copy,nonatomic)NSString* sponsorId;
@property(copy,nonatomic)NSString* name;
@property(copy,nonatomic)NSString* location;
@property(copy,nonatomic)NSString* briefIntro;

@end
