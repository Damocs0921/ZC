//
//  MineViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MineViewController.h"
#import "MineViewModel.h"
#import "UserHeaderView.h"
#import "TableViewDevider.h"

#import "FeedbackViewController.h"
#import "CompanyIntroductionViewController.h"
#import "MyAddressListViewController.h"
#import "MyOrdersViewController.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UserHeaderView* _headerView;
    UITableView* _tableView;
    
    MineViewModel* _viewModel;
    NSArray* _titleArray;
}
@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)bindViewModel
{
    _viewModel = [[MineViewModel alloc]init];
    _titleArray = @[@[@"我的支持",@"我的发起",@"收货地址"],@[@"关于我们",@"意见反馈"],@[@"退出登录"]];
}

-(void)initUIView
{
    self.navigationItem.title = @"个人";
    [self setBackButton:false];

    [self setUpHeaderView];
    [self setUpTableView];
}

-(void)setUpHeaderView
{
    _headerView = [[UserHeaderView alloc]init];
}

-(void)setUpTableView
{
    CGFloat tabbarHeight = self.navigationController.tabBarController.tabBar.frame.size.height;
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - tabbarHeight - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
   
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setTableFooterView:[TableViewDevider getFooterView]];
    [TableViewDevider customDeviderOfTable:_tableView];
    
    [self.view addSubview:_tableView];
}

-(void)cancelWebRequest
{

}

-(void)reloadUserView
{
    [_headerView setUserData:_viewModel.user];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_titleArray count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    
    return [(NSArray*)[_titleArray objectAtIndex:section - 1] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* cellId = [NSString stringWithFormat:@"MineViewControllerCell_%ld",(long)indexPath.section];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 0)
        {
            [cell addSubview:_headerView];
        }
    }
    
    if (indexPath.section != 0)
    {
        if (indexPath.section != 3)
        {
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.textColor = [UIColor blackColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.backgroundColor = CUSTOM_ORANGE;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        cell.textLabel.text = [[_titleArray objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return _headerView.frame.size.height;
    }
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [TableViewDevider singleLine];
    }
    
    return [TableViewDevider getHeaderView:false];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            MyOrdersViewController *orderViewController = [[MyOrdersViewController alloc]init];
            orderViewController.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:orderViewController animated:true];
        }
        else if (indexPath.row == 2)
        {
            MyAddressListViewController* addrViewController = [[MyAddressListViewController alloc]init];
            addrViewController.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:addrViewController animated:true];
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            CompanyIntroductionViewController* introViewController = [[CompanyIntroductionViewController alloc]initWithText:_viewModel.intro];
            introViewController.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:introViewController animated:true];
        }
        else if (indexPath.row == 1)
        {
            FeedbackViewController* feedBackViewController = [[FeedbackViewController alloc]init];
            feedBackViewController.hidesBottomBarWhenPushed = true;
            [self.navigationController pushViewController:feedBackViewController animated:true];
        }
    }
    
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
