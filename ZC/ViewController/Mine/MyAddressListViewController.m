//
//  MyAddressListViewController.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MyAddressListViewController.h"
#import "AddressListViewModel.h"
#import "TableViewDevider.h"
#import "MJRefresh.h"
#import "AddressCell.h"
#import "EditAddressViewController.h"

@interface MyAddressListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    AddressListViewModel *_viewModel;
}
@end

@implementation MyAddressListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)bindViewModel
{
    _viewModel = [[AddressListViewModel alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAddressEdited) name:NOTIFICATION_EDIT_ADDR object:nil];
}

-(void)initUIView
{
    self.navigationItem.title = @"收货地址列表";
    [self setBackButton:true];
    
    [self setUpTableView];
    [self refresh];
}

-(void)cancelWebRequest
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_EDIT_ADDR object:nil];
}

-(void)setUpTableView
{
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
    _tableView.separatorColor = BACKGROUND_COLOR;
    
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refresh)];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [TableViewDevider customDeviderOfTable:_tableView];
    [_tableView setTableFooterView:[TableViewDevider getFooterView]];
    
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel.addressesArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isAddingCell:indexPath])
    {
        NSString* cellId = @"AddAddressCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = THEME_BLUE;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.textLabel.text = @" + 添加收货地址";
        }
        
        return cell;
    }
    else
    {
        NSString* cellId = @"AddressCell";
        
        AddressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setData:[_viewModel.addressesArray objectAtIndex:indexPath.row]];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isAddingCell:indexPath])
    {
        return 44;
    }
    
    return 70;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isAddingCell:indexPath])
    {
        EditAddressViewController* editAddrViewController = [[EditAddressViewController alloc] initWithAddress:nil];
        [self.navigationController pushViewController:editAddrViewController animated:true];
    }
    else
    {
        EditAddressViewController* editAddrViewController = [[EditAddressViewController alloc] initWithAddress:[_viewModel.addressesArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:editAddrViewController animated:true];
    }
}


-(void)refresh
{
    [self showWaiting];
    [_viewModel loadAddressesArray:^(BOOL isLoaded)
     {
         [self hideWaiting];
         [_tableView reloadData];
     }
     failure:^(NSString *error)
     {
         [self hideWaiting];
         [self showToast:error];
     }];
}

-(BOOL)isAddingCell:(NSIndexPath*)indexPath
{
    return ((indexPath.row == 0 && [_viewModel.addressesArray count] == 0) || (indexPath.row == [_viewModel.addressesArray count] && [_viewModel.addressesArray count] != 0));
}

-(void)onAddressEdited
{
    [self refresh];
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
