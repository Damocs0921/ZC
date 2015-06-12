//
//  SponsorCell.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "SponsorCell.h"
#import "UIImageView+WebCache.h"

@interface SponsorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@end

@implementation SponsorCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(SponsorDto*)data
{
    if (data == nil)
    {
        return;
    }
    
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:data.avatarUrl]];
     self.nameLabel.text = data.name;
    self.locationLabel.text = data.location;
    self.introLabel.text = data.briefIntro;
}

@end
