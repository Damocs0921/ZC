//
//  ProjectCell.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ProjectCell.h"
#import "UIImageView+WebCache.h"

@interface ProjectCell()
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UILabel *hasReachedLabel;
@property (weak, nonatomic) IBOutlet UILabel *hasCollectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;
@end

@implementation ProjectCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(ProjectDto*)data
{
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:data.url] placeholderImage:[UIImage imageNamed:@"img_demo_project"]];
    self.hasReachedLabel.text = [NSString stringWithFormat:@"%ld %%",data.hasReached] ;
    self.hasCollectedLabel.text= [NSString stringWithFormat:@"￥%ld",data.hasCollected] ;
    self.daysLeftLabel.text = [NSString stringWithFormat:@"%ld天",data.daysLeft] ;
}

@end
