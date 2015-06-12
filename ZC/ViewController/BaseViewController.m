//
//  BaseViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Toast.h"
#import "MBProgressHUD.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customUIConfig];
    
    [self bindViewModel];
    [self initUIView];
}

-(void)customUIConfig
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    self.navigationItem.hidesBackButton = true;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = THEME_BLUE;
}

- (void)bindViewModel
{
    NSLog(@"BindViewModel Not Implemented");
}
- (void)initUIView
{
    NSLog(@"InitUIView Not Implemented");
}

- (void)cancelWebRequest
{
    NSLog(@"CancelWebRequest Not Implemented");
}


- (void)setBackButton:(BOOL)isShown
{
    if (isShown)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    } else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

- (void)goBack
{
   [self.navigationController popViewControllerAnimated:true];
}


- (void)showWaiting
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
}

- (void)hideWaiting
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)showToast:(NSString*)str
{
    if (str)
       [self.view makeToast:str duration:2.0 position:CSToastPositionCenter];
}

- (void)dealloc
{
    [self cancelWebRequest];
    
     NSLog(@"Dealloc %@", NSStringFromClass([self class]));
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
