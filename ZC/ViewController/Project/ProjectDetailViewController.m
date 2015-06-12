//
//  ProjectDetailViewController.m
//  ZC
//
//  Created by DamocsYang on 6/11/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "ProjectDetailViewModel.h"
#import "ProductDetailCell.h"
#import "SponsorCell.h"
#import "TableViewDevider.h"
#import "MJRefresh.h"


@interface ProjectDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString* _projectId;
    ProjectDetailViewModel* _viewModel;
    
    UITableView* _tableView;
    UIImageView* _headerImageView;
}
@end

@implementation ProjectDetailViewController

-(id)initWithProjectId:(NSString*)projectId
{
    if (self = [super init])
    {
        _projectId = projectId;
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
    _viewModel = [[ProjectDetailViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"项目详情";
    [self setBackButton:true];
    
    [self setUpTableView];
    
    [self loadData];
}

-(void)setUpTableView
{
    CGFloat navibarHeight = self.navigationController.navigationBar.frame.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenFrameHeight - navibarHeight)];
    _tableView.backgroundColor = BACKGROUND_COLOR;
    
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    _tableView.footer.hidden = true;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [TableViewDevider customDeviderOfTable:_tableView];
    
    [self.view addSubview:_tableView];
}

-(void)loadData
{
   
}

-(void)loadMore
{

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
            break;
            
        default:
            break;
    }
    
    return 0;
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
