//
//  ProjectViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/8/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ProjectViewModel.h"
#import "ProjectDto.h"

@interface ProjectViewModel()
{
    BOOL _canLoadMore;
}
@end

@implementation ProjectViewModel

-(id)init
{
    if (self = [super init])
    {
        _projectsArray = [[NSMutableArray alloc]init];
        _canLoadMore = false;
    }
    
    return self;
}

-(void)loadProjectsArray:(BOOL)isRefresh success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"ProjectDto"];
    
    [query orderByDescending:@"updatedAt"];
    
    query.limit = LIST_PAGE_SIZE;
    
    if (isRefresh)
    {
        query.skip = 0;
    }
    else
    {
        query.skip = [_projectsArray count];
    }
    
    
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
             
             if (isRefresh)
             {
                 _canLoadMore = ([array count] >= LIST_PAGE_SIZE);
                 [_projectsArray removeAllObjects];
             }
             else
             {
                 _canLoadMore = ([array count] > 0);
             }

             
             if (isRefresh)
             {
                 [_projectsArray removeAllObjects];
             }
             
             
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

-(BOOL)canLoadMore
{
    return _canLoadMore;
}

@end
