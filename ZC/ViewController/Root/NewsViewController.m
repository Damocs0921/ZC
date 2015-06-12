//
//  NewsViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "TableViewDevider.h"
#import "NewsViewModel.h"
#import "MJRefresh.h"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NewsViewModel* _viewModel;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)bindViewModel
{
    _viewModel = [[NewsViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"资讯";
    [self setBackButton:false];
    
    [self setUpTableView];
    
    [self refresh];
}


-(void)setUpTableView
{
    CGFloat tabbarHeight = self.navigationController.tabBarController.tabBar.frame.size.height;
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - tabbarHeight - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
    
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    _tableView.footer.hidden = true;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [TableViewDevider customDeviderOfTable:_tableView];
    
    [self.view addSubview:_tableView];
}

-(void)refresh
{
    [self loadData:true];
}

-(void)loadMore
{
    [self loadData:false];
}


-(void)loadData:(BOOL)isRefresh
{
    [_viewModel loadNewsArray:isRefresh success:^(BOOL isLoaded)
    {
        if (isRefresh)
        {
            [_tableView.header endRefreshing];
        }
        else
        {
            [_tableView.footer endRefreshing];
        }
        
        _tableView.footer.hidden = ![_viewModel canLoadMore];
         [_tableView reloadData];
     }
     failure:^(NSString *error)
     {
         if (isRefresh)
         {
             [_tableView.header endRefreshing];
         }
         else
         {
             [_tableView.footer endRefreshing];
         }

         
         _tableView.footer.hidden = ![_viewModel canLoadMore];
         [self showToast:error];
     }];
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel.noticesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellId = @"NewsCell";
    
    NewsCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setData:[_viewModel.noticesArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
