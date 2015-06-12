//
//  MainServiceCell.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MainServiceCell.h"

@implementation MainServiceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)serviceClicked:(id)sender
{
    UIButton* btn = (UIButton*)sender;
    
    if (self.serviceDelegate!=nil)
    {
        [self.serviceDelegate onServiceClicked:btn.tag];
    }
}

@end
