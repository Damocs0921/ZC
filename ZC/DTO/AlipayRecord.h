//
//  AlipayRecord.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


/**
 *  支付宝支付成功的订单记录
 */
@interface AlipayRecord : NSObject

@property(copy,nonatomic)NSString* alipayOrderId;
@property(copy,nonatomic)NSString* orderId;
@property(copy,nonatomic)NSString* userId;
@property(assign,nonatomic)CGFloat amount;

@end
