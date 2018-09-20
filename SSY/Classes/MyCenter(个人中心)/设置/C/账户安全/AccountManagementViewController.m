//
//  AccountManagementViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/28.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "AccountManagementViewController.h"
//修改密码页面
#import "ChangePawdViewController.h"
//修改手机号页面
#import "ChangePhoneViewController.h"

#import "FormTableModel.h"

#import "FormTableViewCell.h"

#import "FormTableSelectCell.h"

@interface AccountManagementViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,copy) NSArray *setItems;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) NSDictionary *formDic;

@end

@implementation AccountManagementViewController

#pragma mark - 懒加载
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        
        
        //注册
        [_tableView registerClass:[FormTableViewCell class] forCellReuseIdentifier:@"FormTableViewCellID"];
        [_tableView registerClass:[FormTableSelectCell class] forCellReuseIdentifier:@"FormTableSelectCellID"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self createData];
}

#pragma mark -init
-(void)setUpBase{
    self.title = @"账户安全";
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.tableView];
}

-(void)createData{
    
    _dataArray = @[].mutableCopy;
    
    FormTableModel *password = [FormTableModel new];
    password.cellType = CreateTableCell;
    password.title = @"修改手密码";
    [self.dataArray addObject:password];
    
    FormTableModel *phone = [FormTableModel new];
    phone.cellType = CreateTableSelectCell;
    phone.title = @"修改手机号";
    phone.placeholder = @"13121378101";
    phone.key = @"phone";
    [self.dataArray addObject:phone];
    
}

#pragma mark -----------------------------<UITableViewDataSource>-----------------------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = nil;
    FormTableModel *model = self.dataArray[indexPath.row];
    if(model.cellType == CreateTableCell){
        FormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableViewCellID"];
        cell.CreateTableModel = model;
        tableViewCell = cell;
        
    }else{
        FormTableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableSelectCellID"];
        cell.CreateTableModel = model;
        tableViewCell = cell;
        
    }
    
    return tableViewCell;
}

#pragma mark -----------------------------<UITableViewDelegate>-------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if(indexPath.row==0){//修改登录密码
        ChangePawdViewController *changePawdVC = [[ChangePawdViewController alloc] init];
        [self.navigationController pushViewController:changePawdVC animated:YES];
    }else{//修改手机号
        ChangePhoneViewController *changePhoneVC = [[ChangePhoneViewController alloc] init];
        [self.navigationController pushViewController:changePhoneVC animated:YES];
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
