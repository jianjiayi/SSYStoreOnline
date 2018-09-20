//
//  SettingViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SettingViewController.h"
//个人资料
#import "PersonalDataViewController.h"
//地址管理
#import "AddressManagementViewController.h"
//账户安全
#import "AccountManagementViewController.h"
//意见反馈
#import "FeedbackViewController.h"

//cell
#import "settingTableViewCell.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,copy) NSArray *setItems;

@end

@implementation SettingViewController

#pragma mark - 懒加载
//tableView
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        [_tableView registerClass:[settingTableViewCell class] forCellReuseIdentifier:@"settingTableViewCellID"];
    }
    return _tableView;
}

-(NSArray *)setItems{
    if(!_setItems){
        _setItems = [[NSArray alloc] init];
        _setItems = @[@"个人资料",@"地址管理",@"账户安全",@"意见反馈"];
    }
    return _setItems;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
}

#pragma mark - init
-(void)setUpBase{
    self.title = @"设置";
    self.view.backgroundColor = RGB(244, 244, 244);
    
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark -----------------------<UITableViewDataSource>--------------------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.setItems.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    settingTableViewCell *tableCell = nil;
    settingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingTableViewCellID"];
    cell.titleContent = self.setItems[indexPath.row];
    tableCell = cell;
    return tableCell;
}
//注销登录
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [[UITableViewHeaderFooterView alloc] init];
    UIButton *logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logOutBtn.frame = CGRectMake(0, 10, ScreenW, 48);
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutBtn.titleLabel.font = PFR14Font;
    [logOutBtn setTitleColor:MColor forState:UIControlStateNormal];
    logOutBtn.backgroundColor = [UIColor whiteColor];
    [logOutBtn addTarget:self action:@selector(signOutClick) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:logOutBtn];
    return footerView;
}

#pragma mark ----------------------<UITableViewDelegate>----------------------------------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"点击tableView");
    if(indexPath.row == 0){//个人资料
        PersonalDataViewController *personalDataVC = [[PersonalDataViewController alloc] init];
        [self.navigationController pushViewController:personalDataVC animated:YES];
    }
    if(indexPath.row ==1){//地址管理
        AddressManagementViewController *addressMangeVC = [[AddressManagementViewController alloc] init];
        [self.navigationController pushViewController:addressMangeVC animated:YES];
    }
    if(indexPath.row ==2){//账户安全
        AccountManagementViewController *accountMangeVC = [[AccountManagementViewController alloc] init];
        [self.navigationController pushViewController:accountMangeVC animated:YES];
    }
    if(indexPath.row ==3){//意见反馈
        FeedbackViewController *feedbackVC = [[FeedbackViewController alloc] init];
        [self.navigationController pushViewController:feedbackVC animated:YES];
    }
}

//注销登录
-(void)signOutClick{
    NSLog(@"wqerqwerqwer");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"确定注销登录？" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定注销登录");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 100;
    
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
