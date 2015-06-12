//
//  NewsViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/8/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface NewsViewModel : BaseViewModel

@property(readonly,nonatomic,retain)NSMutableArray* noticesArray;


-(void)loadNewsArray:(BOOL)isRefresh success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

-(BOOL)canLoadMore;

@end
