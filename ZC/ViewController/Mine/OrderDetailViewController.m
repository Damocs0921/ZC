//
//  OrderDetailViewController.m
//  ZC
//
//  Created by DamocsYang on 6/10/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "AddressCell.h"
#import "PayAndRewardCell.h"
#import "SponsorCell.h"
#import "OrderNoteCell.h"
#import "OrderDetailViewModel.h"
#import "TableViewDevider.h"
#import "OrderDetailButton.h"

@interface OrderDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString* _orderId;
    OrderDetailViewModel* _viewModel;
    
    UITableView* _tableView;
    OrderDetailButton* _nextButton;
}
@end

@implementation OrderDetailViewController

-(id)initWithOrderId:(NSString*)orderId
{
    if (self = [super init])
    {
        _orderId = orderId;
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
    _viewModel = [[OrderDetailViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"订单详情";
    [self setBackButton:true];
    
    [self setUpTableView];
    
    [self loadData];
}

-(void)setUpTableView
{
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
    _tableView.separatorColor = BACKGROUND_COLOR;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setTableFooterView:[self getFooterView]];
    [TableViewDevider customDeviderOfTable:_tableView];
    
    [self.view addSubview:_tableView];
}

-(UIView*)getFooterView
{
    UIView* footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    footerView.backgroundColor = BACKGROUND_COLOR;
    
    _nextButton = [[OrderDetailButton alloc]initWithFrame:CGRectMake(20, 25 , ScreenWidth - 40, 50)];
    _nextButton.backgroundColor = [UIColor whiteColor];
    [_nextButton addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:_nextButton];
    
    UIView *tpLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, LINE_HEIGHT)];
    tpLine.backgroundColor = DEVIDE_LINE_COLOR;
    [footerView addSubview:tpLine];

    return footerView;
}


-(void)loadData
{
    [self showWaiting];
    [_viewModel loadOrderDetail:_orderId success:^(BOOL isLoaded)
    {
        [self hideWaiting];
        [_tableView reloadData];
        [_nextButton setOrderState:(ORDER_STATE)_viewModel.orderDetail.state];
        [self loadOthers];
    } failure:^(NSString *error) {
        [self hideWaiting];
        [self showToast:error];
    }];
}

-(void)loadOthers
{
    [_viewModel loadAddress:_viewModel.orderDetail.addressId success:^(BOOL isLoaded)
     {
         [_tableView reloadData];
     } failure:^(NSString *error) {
         [self showToast:error];
     }];
    
    [_viewModel loadSponsor:_viewModel.orderDetail.sponsorId success:^(BOOL isLoaded)
     {
         [_tableView reloadData];
     } failure:^(NSString *error) {
         [self showToast:error];
     }];
    
    [_viewModel loadReward:_viewModel.orderDetail.rewardId success:^(BOOL isLoaded)
     {
         [_tableView reloadData];
     } failure:^(NSString *error) {
         [self showToast:error];
     }];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        NSString* cellId = @"AddressCell";
        
        AddressCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setData:_viewModel.address];
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        NSString* cellId = @"PayAndRewardCell";
        
        PayAndRewardCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.amountToPayLabel.text = [NSString stringWithFormat:@"支付金额：￥%.2f",_viewModel.orderDetail.price];
        cell.rewardLabel.text = [NSString stringWithFormat:@"回报内容：%@",_viewModel.reward.content];
        cell.rewardTimeLabel.text = [NSString stringWithFormat:@"回报时间：%@",_viewModel.reward.sendTime];
        
        return cell;
    }
    else if (indexPath.section == 2)
    {
        NSString* cellId = @"SponsorCell";
        
        SponsorCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setData:_viewModel.sponsor];
        return cell;
    }
    else if (indexPath.section == 3)
    {
        NSString* cellId = @"OrderNoteCell";
        
        OrderNoteCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.orderIdLabel.text = [NSString stringWithFormat:@"订单号：%@",_viewModel.orderDetail.orderId];
        cell.orderTimeLabel.text = [NSString stringWithFormat:@"下单时间：%@",_viewModel.orderDetail.orderTime];
        cell.noteLabel.text = [NSString stringWithFormat:@"备注：%@",_viewModel.orderDetail.orderNote];
        
        return cell;
    }

    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 70;
            break;
        case 1:
            return 95;
            break;
        case 2:
            return 85;
            break;
        case 3:
            return 95;
            break;
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 40;
    }
    
    return 20;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        [TableViewDevider getNoTopLineView];
    }
    else if (section == 1)
    {
        return [TableViewDevider getHighHeaderWithString:@"" hasTopLine:true];
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

-(void)goNext
{
   

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
