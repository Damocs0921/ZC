//
//  PayAndRewardCell.h
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayAndRewardCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *amountToPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *rewardLabel;
@property (weak, nonatomic) IBOutlet UILabel *rewardTimeLabel;
@end
