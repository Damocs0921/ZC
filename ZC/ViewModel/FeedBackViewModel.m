//
//  FeedBackViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "FeedBackViewModel.h"

@implementation FeedBackViewModel

-(void)postFeedBack:(NSString*)str success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    BmobObject  *feedback = [BmobObject objectWithClassName:@"FeedBack"];

    [feedback setObject:str forKey:@"content"];
    [feedback setObject:[ZCAPPSingleton instance].currentUser.phoneNumber forKey:@"phone"];

    [feedback saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error)
     {
        if (isSuccessful)
        {
            NSLog(@"objectid :%@",feedback.objectId);
            
            success(true);
            
        } else if (error)
        {
            failure(error.localizedDescription);
        } else {
             failure(@"提交失败");
        }
    }];
}

@end
