//
//  MyOrdersViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"

@interface MyOrdersViewModel : BaseViewModel

@property(readonly,nonatomic,retain)NSMutableArray* ordersArray;


-(void)loadOrdersArray:(BOOL)isRefresh success:(void (^)(BOOL))success failure:(void (^)(NSString* error))failure;

-(BOOL)canLoadMore;

@end
