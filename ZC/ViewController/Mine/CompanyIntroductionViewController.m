//
//  CompanyIntroductionViewController.m
//  JJJR
//
//  Created by DamocsYang on 5/19/15.
//  Copyright (c) 2015 fengzeyan. All rights reserved.
//

#import "CompanyIntroductionViewController.h"

@interface CompanyIntroductionViewController ()
{
    NSString* _introText;
    
    UILabel* _titleLabel;
    UITextView *_introTextView;
}
@end

@implementation CompanyIntroductionViewController

-(id)initWithText:(NSString*)str
{
    if (self = [super init])
    {
        _introText = str;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)initUIView
{
    self.navigationItem.title = @"公司简介";
    [self setBackButton:true];
    
    [self setUpViews];
    [self addConstraints];
}

-(void)setUpViews
{
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.text = @"上海蜜糖信息科技有限公司";
    [self.view addSubview:_titleLabel];
    
    _introTextView = [[UITextView alloc]init];
    _introTextView.backgroundColor = BACKGROUND_COLOR;
    _introTextView.text = _introText;
    _introTextView.userInteractionEnabled = false;
        [self.view addSubview:_introTextView];
}

-(void)addConstraints
{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(@50);
    }];
    
    [_introTextView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(_titleLabel.mas_bottom).offset(10);
         make.left.equalTo(self.view).offset(10);
         make.right.equalTo(self.view).offset(-10);
         make.bottom.equalTo(self.view).offset(-20);
     }];
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
