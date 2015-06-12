//
//  NewsViewModel.m
//  ZC
//
//  Created by DamocsYang on 6/8/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsDto.h"

@interface NewsViewModel()
{
    BOOL _canLoadMore;
}
@end

@implementation NewsViewModel

-(id)init
{
    if (self = [super init])
    {
        _noticesArray = [[NSMutableArray alloc]init];
        _canLoadMore = false;
    }
 
    return self;
}

-(void)loadNewsArray:(BOOL)isRefresh success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure
{

    BmobQuery *query = [BmobQuery queryWithClassName:@"NewsDto"];
    
    [query orderByAscending:@"title"];
    
    query.limit = LIST_PAGE_SIZE;

    if (isRefresh)
    {
        query.skip = 0;
    }
    else
    {
        query.skip = [_noticesArray count];
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
                [_noticesArray removeAllObjects];
            }
            else
            {
                _canLoadMore = ([array count] > 0);
            }
            
            if (isRefresh)
            {
                [_noticesArray removeAllObjects];
            }
            
            
            for (BmobObject* obj in array)
            {
                NewsDto* dto = [[NewsDto alloc]init];
                dto.title = [obj objectForKey:@"title"];
                dto.abstract = [obj objectForKey:@"abstract"];
                dto.time = [obj objectForKey:@"time"];
                dto.url = [obj objectForKey:@"url"];
                dto.objectId = obj.objectId;
                [_noticesArray addObject:dto];
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
