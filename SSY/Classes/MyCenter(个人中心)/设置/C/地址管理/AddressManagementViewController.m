//
//  AddressManagementViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/28.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "AddressManagementViewController.h"

//新增地址
#import "addAddressViewController.h"

//修改地址
#import "modifyAddressViewController.h"

//数据模型
#import "createAddressModel.h"

//cell
#import "MCAddressTableViewCell.h"

@interface AddressManagementViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) UIView *footerView;


@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation AddressManagementViewController

#pragma mark -懒加载
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight-TabBarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册
        [_tableView registerClass:[MCAddressTableViewCell class] forCellReuseIdentifier:@"addressTableViewCellID"];
    }
    return _tableView;
}

#pragma mark - 底部按钮
-(UIView *)footerView
{
    if(!_footerView){
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-TabBarHeight, ScreenW, TabBarHeight)];
        _footerView.backgroundColor = MColor;
        UIButton *submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
        [submitBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        submitBtn.titleLabel.font = PFR14Font;
        [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        submitBtn.backgroundColor = MColor;
        [submitBtn addTarget:self action:@selector(addAddressClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:submitBtn];
    }
    return _footerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self createData];
}

#pragma mark -init
-(void)setUpBase{
    self.title = @"地址管理";
    self.view.backgroundColor = RGB(244, 244, 244);
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.footerView];
}

#pragma mark - 加载数据
-(void)createData{
    _dataArray = @[].mutableCopy;
    for (int i=0; i<=10; i++) {
        NSData *jsonData = @{@"name":@"菅双鹏",@"phone":@"13121378101",@"address":@"河北省廊坊股显现爱神的箭发神经的",@"isSelect":@"NO"};
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        [self.dataArray addObject:jsonData];
    }
}


#pragma mark -------------------------------------------<UITableViewDataSource>-------------------------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"sdasfa:%lu",self.dataArray.count);
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = nil;
    createAddressModel *model = self.dataArray[indexPath.row];
    
    MCAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressTableViewCellID"];
    cell.backgroundColor = [UIColor whiteColor];
//    cell.CreateAddressModel = model;
    tableViewCell = cell;
    //事件分离
    [self clickCellView:cell addressModel:model indexPath:indexPath];
    return tableViewCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
    
}

#pragma mark ----------------------------------------<UITableViewDelegate>---------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


//选择、编辑、删除等事件处理
-(void)clickCellView:(MCAddressTableViewCell *)cell
        addressModel:(createAddressModel *)addressModel
           indexPath:(NSIndexPath *)indexPath{
    //选择默认
    cell.setDefualtClickBlock = ^(BOOL isSelect) {
        if(isSelect){
//            self.dataArray[indexPath.row]
        }else{
            
        }
    };
    //编辑
    cell.editClickBlock = ^{
        modifyAddressViewController *modifyAdVC = [[modifyAddressViewController alloc] init];
        [self.navigationController pushViewController:modifyAdVC animated:YES];
    };
    //删除
    cell.delClickBlock = ^{
        NSLog(@"店里删除地址");
    };
}


//新增地址
-(void)addAddressClick{
    addAddressViewController *addAddressVC = [[addAddressViewController alloc] init];
    [self.navigationController pushViewController:addAddressVC animated:YES];
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
