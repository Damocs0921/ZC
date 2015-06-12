//
//  ZCRootViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ZCRootViewController.h"
#import "MainViewController.h"
#import "ProjectViewController.h"
#import "NewsViewController.h"
#import "MineViewController.h"

@interface ZCRootViewController ()
{
    UITabBarController* _tabBarController;
    
    MainViewController* _mainViewController;
    ProjectViewController* _projectViewController;
    NewsViewController* _newsViewController;
    MineViewController* _mineViewController;
}
@end

@implementation ZCRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initUIView
{
    [self goToAPPView];
}


#pragma mark - 跳转逻辑

-(void)goToGuideView
{
    //引导页逻辑
}


-(void)goToAPPView
{
    if (_tabBarController == nil)
    {
        [self setUpTabbar];
    }
    
    [self.navigationController pushViewController:_tabBarController animated:NO];
}


#pragma mark - UITabbarController related

-(void)setUpTabbar
{
    MainViewController *mainViewController = [[MainViewController alloc] init];
    ProjectViewController *projectViewController = [[ProjectViewController alloc] init];
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    MineViewController *mineViewController = [[MineViewController alloc] init];
    
    mainViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_main_normal"] selectedImage:[UIImage imageNamed:@"tab_main_select"]];
    projectViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"项目" image:[UIImage imageNamed:@"tab_product_normal"] selectedImage:[UIImage imageNamed:@"tab_product_select"]];
    newsViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯" image:[UIImage imageNamed:@"tab_user_normal"] selectedImage:[UIImage imageNamed:@"tab_user_select"]];
    mineViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人" image:[UIImage imageNamed:@"tab_more_normal"] selectedImage:[UIImage imageNamed:@"tab_more_select"]];
    
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    UINavigationController *bussinessNavigationController = [[UINavigationController alloc] initWithRootViewController:projectViewController];
    UINavigationController *userNavigationController = [[UINavigationController alloc] initWithRootViewController:newsViewController];
    UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:mineViewController];
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    _tabBarController.viewControllers = @[mainNavigationController, bussinessNavigationController, userNavigationController, moreNavigationController];
}

- (void)tabBarController:(UITabBarController *)tabBarController1 didSelectViewController:(UIViewController *)viewController
{
    //登录逻辑
    
}

/**
 *  强制跳转
 *
 */
- (void)setTabBarSelectedIndex:(NSInteger)selectIndex
{
    if (selectIndex <= 3 && selectIndex >= 0)
    {
        _tabBarController.selectedIndex = selectIndex;
    }
    
    return;
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
