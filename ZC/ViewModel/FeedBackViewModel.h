//
//  FeedBackViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"

@interface FeedBackViewModel : BaseViewModel

-(void)postFeedBack:(NSString*)str success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

@end
