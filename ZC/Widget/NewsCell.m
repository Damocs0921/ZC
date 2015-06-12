//
//  NewsCell.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *abstractLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setData:(NewsDto*)data
{
    if (data == nil) {
        return;
    }
    
    self.titleLabel.text = data.title;
    self.abstractLabel.text = data.abstract;
    self.dateLabel.text = data.time;

}

@end
