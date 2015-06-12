//
//  MainViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MainViewModel.h"
#import "ProjectDto.h"

@implementation MainViewModel

-(id)init
{
    if (self = [super init])
    {
        _adsImageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"img_demo_project"],[UIImage imageNamed:@"img_demo_project"],[UIImage imageNamed:@"img_demo_project"], nil];
        _projectsArray = [[NSMutableArray alloc]init];
    }

    return self;
}

-(void)loadProjectsArray:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
   
    BmobQuery *query = [BmobQuery queryWithClassName:@"ProjectDto"];
    
    [query orderByDescending:@"updatedAt"];
    
    query.limit = 5;
    
    //执行查询
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error)
     {
         if (error!=nil)
         {
             failure(error.localizedDescription);
         }
         else
         {
             NSLog(@"array = %@",array);
             
             for (BmobObject* obj in array)
             {
                 ProjectDto* dto = [[ProjectDto alloc]init];
                 dto.hasReached = [[obj objectForKey:@"hasReached"]integerValue];
                 dto.hasCollected = [[obj objectForKey:@"hasCollected"]integerValue];
                 dto.daysLeft = [[obj objectForKey:@"daysLeft"]integerValue];
                 dto.url = [obj objectForKey:@"url"];
                 dto.objectId = obj.objectId;
                 [_projectsArray addObject:dto];
             }
             
             success(true);
         }
     }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
