//
//  ProductDetailCell.m
//  ZC
//
//  Created by DamocsYang on 6/11/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ProductDetailCell.h"

@interface ProductDetailCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *hasCollectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *hasSupportedLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;

@end

@implementation ProductDetailCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(ProjectDetail*)data
{
    if (data == nil)
    {
        return;
    }

}

@end
