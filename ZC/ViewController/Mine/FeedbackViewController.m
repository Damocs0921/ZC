//
//  FeedbackViewController.m
//  JJJR
//
//  Created by DamocsYang on 5/15/15.
//  Copyright (c) 2015 fengzeyan. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedBackViewModel.h"
#import "UIPlaceHolderTextView.h"

#define MAX_FEEDBACK 300

@interface FeedbackViewController ()
{
    FeedBackViewModel *_viewModel;
    
    UIPlaceHolderTextView *_txtFeedBack;
    UIButton *_btnSubmit;
    UILabel *_lblCountNotice;
}
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)bindViewModel
{
    _viewModel = [[FeedBackViewModel alloc] init];
}

- (void)initUIView
{
    self.navigationItem.title = @"意见反馈";
    [self setBackButton:true];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitFeedback)];
    
    [self setUpViews];
    [self addConstraints];
}

-(void)setUpViews
{
    _txtFeedBack = [[UIPlaceHolderTextView alloc] init];
    _txtFeedBack.placeholder = @"写下您遇到的问题或者建议";
    _txtFeedBack.delegate = self;
    [self.view addSubview:_txtFeedBack];

    _lblCountNotice = [[UILabel alloc] init];
    _lblCountNotice.textColor = [UIColor grayColor];
    _lblCountNotice.text = [NSString stringWithFormat:@"还可以输入%d字",MAX_FEEDBACK];
    _lblCountNotice.textAlignment = NSTextAlignmentRight;
    _lblCountNotice.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:_lblCountNotice];
    
}

-(void)addConstraints
{
    [_txtFeedBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(20);
        make.height.mas_equalTo(@200);
    }];
    
    
    [_lblCountNotice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(_txtFeedBack.mas_bottom).offset(10);
    }];
    
}


- (void)submitFeedback
{
    [self.view endEditing:YES];
    
    if ([StringUtil isNullOrEmpty:_txtFeedBack.text])
    {
        [self showToast:@"请填写反馈意见"];
        return;
    }

    [self showWaiting];
    [_viewModel postFeedBack:_txtFeedBack.text success:^(BOOL hasSent)
     {
        [self hideWaiting];
        [self showToast:@"提交成功"];
        [self performSelector:@selector(goBack) withObject:self afterDelay:1.0];
    }
    failure:^(NSString *errorString)
    {
        [self hideWaiting];
        [self showToast:errorString];
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
- (void)textViewDidChange:(UITextView *)textView
{
    _lblCountNotice.text = [NSString stringWithFormat:@"还可以输入%ld字", (long) ((NSInteger)MAX_FEEDBACK - textView.text.length)];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (range.length + range.location > textView.text.length) {
        return NO;
    }
    NSUInteger newLength = [textView.text length] + [text length] - range.length;
    return newLength <= (NSInteger)MAX_FEEDBACK;
}
@end
