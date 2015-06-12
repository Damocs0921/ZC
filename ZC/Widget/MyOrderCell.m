//
//  MyOrderCell.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MyOrderCell.h"
#import "UIImageView+WebCache.h"

@interface MyOrderCell()
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;

@end

@implementation MyOrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(OrderDto*)data
{
    if (data == nil)
    {
        return;
    }

    [self.thumbImageView sd_setImageWithURL:[NSURL URLWithString:data.thumb] placeholderImage:[UIImage imageNamed:@"img_demo_project"]];
    self.titleLabel.text = data.title;
    self.stateLabel.text = [self getStateTextByIndex:(ORDER_STATE)data.state];
    self.amountLabel.text = [NSString stringWithFormat:@"￥%.2f",data.price];
    self.orderIdLabel.text = data.orderId;
}

-(NSString*)getStateTextByIndex:(ORDER_STATE)state
{
    switch (state)
    {
        case ORDER_STATE_WAIT_PAY:
            return @"去支付";
            break;
        case ORDER_STATE_HAS_PAID:
            return @"待发货";
            break;
        case ORDER_STATE_HAS_SENT:
            return @"已发货";
            break;
        case ORDER_STATE_SUCCESS:
            return @"成功";
            break;
        default:
            return @"";
            break;
    }


}

@end
