//
//  TextViewController.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()
{
    int _type;
    NSString* _title;
}
@end

@implementation TextViewController

-(id)initWithTitle:(NSString*)str andType:(int)type
{
    if (self == [super init])
    {
        _title = str;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)initUIView
{
    self.navigationItem.title = _title;
    [self setBackButton:true];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
