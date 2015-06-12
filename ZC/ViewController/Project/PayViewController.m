//
//  PayViewController.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "PayViewController.h"
#import "PayViewModel.h"

@interface PayViewController ()
{
    
    PayViewModel* _viewModel;
    
    NSString* _orderId;
    NSString* _address;
}
@property (weak, nonatomic) IBOutlet UILabel *orderIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountToPayLabel;
@end

@implementation PayViewController

-(id)initWithOrder:(NSString*)orderId address:(NSString*)address
{
    if (self = [super init])
    {
        _orderId = orderId;
        _address = address;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)bindViewModel
{
    _viewModel = [[PayViewModel alloc]init];
    
   
}

-(void)initUIView
{
    self.navigationItem.title = @"支付页面";
    [self setBackButton:true];
    
    [self loadData];
}

-(void)loadData
{
    [self showWaiting];
    
    [_viewModel getAmountOfOrder:_orderId success:^(CGFloat amount) {
        
        [self hideWaiting];
        self.amountToPayLabel.text = [NSString stringWithFormat:@"支付金额:￥%.2f",amount];
        
    } failure:^(NSString *error)
    {
        [self showToast:error];
    }];
}

- (IBAction)alipayClicked:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
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
