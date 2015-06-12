//
//  OrderDto.h
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum
{
    ORDER_STATE_WAIT_PAY = 0,
    ORDER_STATE_HAS_PAID = 1,
    ORDER_STATE_HAS_SENT = 2,
    ORDER_STATE_SUCCESS = 3,
    
}ORDER_STATE;

@interface OrderDto : NSObject
@property(copy,nonatomic)NSString* orderId;
@property(copy,nonatomic)NSString* userId;
@property(copy,nonatomic)NSString* title;
@property(copy,nonatomic)NSString* thumb;
@property(assign,nonatomic)CGFloat price;
@property(assign,nonatomic)NSInteger state;
@end
