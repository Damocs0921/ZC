//
//  UserHeaderView.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "UserHeaderView.h"
#import "Config.h"

@interface UserHeaderView()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;
@end

@implementation UserHeaderView

-(id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UserHeaderView" owner:self options:nil] objectAtIndex:0];
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth * 120.0 / 320.0);
    return self;
}

-(void)setUserData:(UserDto*)data
{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
