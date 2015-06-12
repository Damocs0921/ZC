//
//  PayViewModel.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewModel.h"

@interface PayViewModel : BaseViewModel

-(void)getAmountOfOrder:(NSString*)orderId success:(void (^)(CGFloat amount))success failure:(void (^)(NSString* error))failure;

@end
