//
//  ProjectViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectCell.h"
#import "TableViewDevider.h"
#import "ProjectViewModel.h"
#import "MJRefresh.h"

@interface ProjectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;

    ProjectViewModel* _viewModel;
}
@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)bindViewModel
{
    _viewModel = [[ProjectViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"项目";
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
    _tableView.separatorColor = BACKGROUND_COLOR;
    
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
    [_viewModel loadProjectsArray:isRefresh success:^(BOOL isLoaded)
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
    return [_viewModel.projectsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellId = @"ProjectCell";
    
    ProjectCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setData:[_viewModel.projectsArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 208;
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
