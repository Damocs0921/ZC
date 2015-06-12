//
//  AddressCell.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "AddressCell.h"

@interface AddressCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation AddressCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(AddressDto*)data
{
    if (data == nil)
    {
        return;
    }
    
    self.nameLabel.text = data.name;
    self.phoneLabel.text = data.phone;
    self.detailLabel.text = [NSString stringWithFormat:@"%@%@%@",data.province,data.city,data.detail];
}

@end
