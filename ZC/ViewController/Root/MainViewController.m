//
//  MainViewController.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewDevider.h"
#import "MainViewModel.h"
#import "ProjectCell.h"
#import "ADScrollView.h"
#import "MainServiceCell.h"
#import "TextViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,ADScrollViewDataSource,ServiceTextDelegate>
{
    UITableView *_tableView;
    ADScrollView* _adScrollView;
    
    MainViewModel* _viewModel;
}
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)bindViewModel
{
    _viewModel = [[MainViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"首页";
    [self setBackButton:false];
    
    [self setUpAdView];
    [self setUpTableView];
    
    [self loadData];
}

-(void)setUpAdView
{
    _adScrollView = [[ADScrollView alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth - 20, (ScreenWidth - 20) * 270 / 600) animationDuration:3.0];
    _adScrollView.dataSource = self;
}



-(void)setUpTableView
{
    CGFloat tabbarHeight = self.navigationController.tabBarController.tabBar.frame.size.height;
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - tabbarHeight - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
    _tableView.separatorColor = BACKGROUND_COLOR;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView setTableFooterView:[TableViewDevider getFooterView]];
    [TableViewDevider customDeviderOfTable:_tableView];
    
    [self.view addSubview:_tableView];
}

-(void)cancelWebRequest
{
   
}


-(void)loadData
{
    [self showWaiting];
    
    [_viewModel loadProjectsArray:^(BOOL isLoaded)
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


- (NSInteger)numberOfSectionsInADScrollView:(ADScrollView *)adScrollView
{
    return [_viewModel.adsImageArray count];
}

- (UIView *)adScrollView:(ADScrollView *)adScrollView contentViewForSection:(NSInteger)index
{
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:adScrollView.bounds];
    
    imageView.image =  [_viewModel.adsImageArray objectAtIndex:index];
    
    return imageView;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return [_viewModel.projectsArray count];
    }
    
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        NSString* cellId = @"MainServiceCell";
        
        MainServiceCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.serviceDelegate = self;
        }
        
        return cell;
    }
    else if (indexPath.section == 2)
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
    else
    {
        NSString* cellId = [NSString stringWithFormat:@"MainViewCell_%ld",(long)indexPath.section];
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (indexPath.section == 0)
            {
                cell.contentView.backgroundColor = BACKGROUND_COLOR;
                [cell addSubview:_adScrollView];
            }
        }
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return _adScrollView.frame.size.height;
            break;
        case 1:
            return 148;
            break;
        case 2:
            return 208;
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 20;
            break;
        case 1:
            return 40;
            break;
        case 2:
            return 40;
        default:
            return 0;
            break;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return [TableViewDevider getHeaderView:false];
            break;
        case 1:
            return [TableViewDevider getHighHeaderWithString:@"我们的服务" hasTopLine:false];
            break;
        case 2:
            return [TableViewDevider getHighHeaderWithString:@"项目推荐" hasTopLine:false];
        default:
            return 0;
            break;
    }
}


-(void)onServiceClicked:(int)type
{
    TextViewController* textViewController = [[TextViewController alloc]initWithTitle:@"详情" andType:type];
    textViewController.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:textViewController animated:true];
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
