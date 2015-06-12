//
//  MainGridView.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MainGridView.h"
#import "Config.h"

@implementation MainGridView

-(id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"MainGridView" owner:self options:nil] objectAtIndex:0];
    
    NSLog(@"%f,%f",self.frame.size.height,self.frame.size.width);
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
