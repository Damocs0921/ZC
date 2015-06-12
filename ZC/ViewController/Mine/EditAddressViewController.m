//
//  EditAddressViewController.m
//  ZC
//
//  Created by DamocsYang on 6/9/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "EditAddressViewController.h"
#import "EditAddressViewModel.h"
#import "HZAreaPickerView.h"

@interface EditAddressViewController ()<HZAreaPickerDelegate,HZAreaPickerDatasource>
{
    HZAreaPickerView* _cityPicker;
    
    AddressDto *_formerAddress;
    EditAddressViewModel* _viewModel;
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *provinceField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *detailField;

@end

@implementation EditAddressViewController

-(id)initWithAddress:(AddressDto*)address
{
    if (self = [super init])
    {
        _formerAddress = address;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)bindViewModel
{
    _viewModel = [[EditAddressViewModel alloc]init];
}

-(void)initUIView
{
    self.navigationItem.title = @"编辑收货地址";
    [self setBackButton:true];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
    
    [self setUpFields];
}

-(void)setUpFields
{
    UILabel* nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    nameLabel.text = @"  姓名";
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    self.nameField.leftView = nameLabel;
    
    UILabel* phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    phoneLabel.text = @"  手机号";
    self.phoneField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneField.leftView = phoneLabel;
    
    UILabel* provinceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    provinceLabel.text = @"  省份";
    self.provinceField.leftViewMode = UITextFieldViewModeAlways;
    self.provinceField.leftView = provinceLabel;
    
    UILabel* cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    cityLabel.text = @"  城市";
    self.cityField.leftViewMode = UITextFieldViewModeAlways;
    self.cityField.leftView = cityLabel;
    
    UILabel* detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    detailLabel.text = @"  详细地址";
    self.detailField.leftViewMode = UITextFieldViewModeAlways;
    self.detailField.leftView = detailLabel;
    
    
    if(_formerAddress!=nil)
    {
        self.nameField.text = _formerAddress.name;
        self.phoneField.text = _formerAddress.phone;
        self.provinceField.text = _formerAddress.province;
        self.cityField.text = _formerAddress.city;
        self.detailField.text = _formerAddress.detail;
    }
}

-(void)cancelWebRequest
{
 
}



-(void)submit
{
    if (_formerAddress !=nil)
    {
        [self doEditFormer];
    }
    else
    {
        [self doAddNew];
    }
}

-(void)doEditFormer
{
    _formerAddress.name = self.nameField.text;
    _formerAddress.phone = self.phoneField.text;
    _formerAddress.province = self.provinceField.text;
    _formerAddress.city = self.cityField.text;
    _formerAddress.detail = self.detailField.text;
    
    
    [self showWaiting];
    [_viewModel editAddress:_formerAddress success:^(BOOL isSuccess)
     {
         [self hideWaiting];
         [self showToast:@"修改成功"];
         [self postNotification];
         [self performSelector:@selector(goBack) withObject:self afterDelay:1.0];
     }
     failure:^(NSString *error)
    {
                        [self hideWaiting];
                        [self showToast:error];
     }];
}

-(void)doAddNew
{
    AddressDto* addr = [[AddressDto alloc]init];
    
    addr.name = self.nameField.text;
    addr.phone = self.phoneField.text;
    addr.province = self.provinceField.text;
    addr.city = self.cityField.text;
    addr.detail = self.detailField.text;
    
    [self showWaiting];
    [_viewModel addAddress:addr success:^(BOOL isSuccess)
     {
         [self hideWaiting];
         [self showToast:@"添加成功"];
         [self postNotification];
         [self performSelector:@selector(goBack) withObject:self afterDelay:1.0];
     }
                   failure:^(NSString *error)
     {
         [self hideWaiting];
         [self showToast:error];
     }];
}

-(void)postNotification
{
    [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_EDIT_ADDR object:self];
}


- (IBAction)showCityPanel:(id)sender
{
    [self.view endEditing:false];
    
    if (_cityPicker == nil)
    {
        _cityPicker = [[HZAreaPickerView alloc]initWithStyle:HZAreaPickerWithStateAndCity withDelegate:self andDatasource:self];
    }
    
    [_cityPicker showInView:self.view];
}

#pragma mark - HZAreaPicker delegate
-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker
{
    self.provinceField.text = picker.locate.state;
    self.cityField.text = picker.locate.city;
}

-(NSArray *)areaPickerData:(HZAreaPickerView *)picker
{
    NSArray *data;
    
    if (picker.pickerStyle == HZAreaPickerWithStateAndCityAndDistrict)
    {
        data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]] ;
    } else
    {
        data = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil]] ;
    }
    return data;
}

-(void)cancelLocatePicker
{
    [_cityPicker cancelPicker];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self cancelLocatePicker];
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
