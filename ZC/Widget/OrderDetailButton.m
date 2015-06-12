//
//  OrderDetailButton.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "OrderDetailButton.h"
#import "Config.h"

@implementation OrderDetailButton

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = 5.0f;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setOrderButtonEnable:false];
    }
    
    return self;
}

-(void)setOrderState:(ORDER_STATE)state
{
    switch (state)
    {
        case ORDER_STATE_WAIT_PAY:
            [self setTitle:@"去支付" forState:UIControlStateNormal];
            break;
        case ORDER_STATE_HAS_PAID:
            [self setTitle:@"已支付" forState:UIControlStateNormal];
            break;
        case ORDER_STATE_HAS_SENT:
            [self setTitle:@"已发货" forState:UIControlStateNormal];
            break;
        case ORDER_STATE_SUCCESS:
            [self setTitle:@"成功" forState:UIControlStateNormal];
            break;
        default:
            [self setTitle:@"" forState:UIControlStateNormal];
            break;
    }

    [self setOrderButtonEnable:(state == ORDER_STATE_WAIT_PAY)];
}

-(void)setOrderButtonEnable:(BOOL)enabled
{
    self.enabled = enabled;
    
    if (enabled)
    {
        self.backgroundColor = THEME_BLUE;
    }
    else
    {
        self.backgroundColor = [UIColor lightGrayColor];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
