//
//  addAddressViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/31.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "addAddressViewController.h"
//数据模型
#import "FormTableModel.h"
//普通输入cell
#import "FormTableNormalCell.h"
//textView模式的cell
#import "FormTableTVCell.h"
//右侧带有滑块按钮
#import "FormTableSwitchCell.h"
//右侧带有选择按钮
#import "FormTableSelectCell.h"


#import "ChooseLocationView.h"
#import "CitiesDataTool.h"

@interface addAddressViewController ()<UITableViewDelegate,UITableViewDataSource,NSURLSessionDelegate,UIGestureRecognizerDelegate>

//选择地址
@property(nonatomic,strong) ChooseLocationView *chooseLocationView;

@property(nonatomic,strong) UIView *cover;

//tableView
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) UIButton *submitBtn;
//数据数组
@property(nonatomic,strong) NSMutableArray *dataArray;
//选择保存字典
@property(nonatomic,strong) NSMutableDictionary *formDic;

@end

@implementation addAddressViewController

#pragma mark - 懒加载
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        //注册
        [_tableView registerClass:[FormTableNormalCell class] forCellReuseIdentifier:@"FormTableNormalCellID"];
        [_tableView registerClass:[FormTableTVCell class] forCellReuseIdentifier:@"FormTableTVCellID"];
        [_tableView registerClass:[FormTableSwitchCell class] forCellReuseIdentifier:@"FormTableSwitchCellID"];
        [_tableView registerClass:[FormTableSelectCell class] forCellReuseIdentifier:@"FormTableSelectCellID"];
    }
    return _tableView;
}

//提交按钮
-(UIButton *)submitBtn{
    if(!_submitBtn){
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(20, 40, ScreenW-40, 40);
        [_submitBtn setTitle:@"保存" forState:UIControlStateNormal];
        [_submitBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        _submitBtn.backgroundColor = MColor;
        _submitBtn.layer.cornerRadius = 20;
        _submitBtn.titleLabel.font = PFR14Font;
    }
    return _submitBtn;
}


//懒加载地址选择器
- (ChooseLocationView *)chooseLocationView{
    
    if (!_chooseLocationView) {
        _chooseLocationView = [[ChooseLocationView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 350, [UIScreen mainScreen].bounds.size.width, 350)];
        
    }
    return _chooseLocationView;
}
//懒加载遮罩层
- (UIView *)cover{
    
    if (!_cover) {
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        _cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        _cover.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [_cover addSubview:self.chooseLocationView];
        __weak typeof (self) weakSelf = self;
        _chooseLocationView.chooseFinish = ^{
            [UIView animateWithDuration:0.25 animations:^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"FormSetContentText" object:@{@"text":weakSelf.chooseLocationView.address}];
                //                weakSelf.addresslabel.text = weakSelf.chooseLocationView.address;
                weakSelf.view.transform = CGAffineTransformIdentity;
                weakSelf.cover.hidden = YES;
            }];
        };
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCover:)];
        [_cover addGestureRecognizer:tap];
        tap.delegate = self;
        _cover.hidden = YES;
        [appWindow addSubview:_cover];
        
    }
    return _cover;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self createData];
}

#pragma mark Init
-(void)setUpBase{
    self.title = @"新增地址";
    self.view.backgroundColor = RGB(244, 244, 244);
    
    [self.view addSubview:self.tableView];
    //初始化一个可变数组
    self.formDic = [NSMutableDictionary dictionary];
    
    
    [[CitiesDataTool sharedManager] requestGetData];
    [self.view addSubview:self.cover];
    
}

#pragma mark -初始化数组
-(void)createData{
    self.dataArray = @[].mutableCopy;
    
    FormTableModel *name = [FormTableModel new];
    name.cellType = CreateTableNormalCell;
    name.placeholder =@"请输入收货人姓名";
    name.key = @"name";
    [self.dataArray addObject:name];
    
    FormTableModel *phone = [FormTableModel new];
    phone.cellType = CreateTableNormalCell;
    phone.placeholder = @"请输入手机号";
    phone.key = @"phone";
    [self.dataArray addObject:phone];
    
    FormTableModel *dist = [FormTableModel new];
    dist.cellType = CreateTableSelectCell;
    dist.title = @"所在地";
    dist.placeholder = @"请选择";
    dist.key = @"dist";
    [self.dataArray addObject:dist];
    
    FormTableModel *address = [FormTableModel new];
    address.cellType = CreateTableTVCell;
    address.placeholder = @"请输入详细地址";
    address.key = @"address";
    [self.dataArray addObject:address];
    
    FormTableModel *defaultAddress = [FormTableModel new];
    defaultAddress.cellType = CreateTableSwitchCell;
    defaultAddress.title = @"设置默认地址";
    defaultAddress.switchState = NO;
    defaultAddress.key = @"state";
    [self.dataArray addObject:defaultAddress];
    
}


#pragma mark --------------------------------<UITableViewDataSource>-------------------------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"asdjkasdhfhas:%lu",self.dataArray.count);
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = nil;
    FormTableModel *model = self.dataArray[indexPath.row];
    if(model.cellType == CreateTableNormalCell){
        FormTableNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableNormalCellID"];
        cell.CreateTableModel = self.dataArray[indexPath.row];
        cell.formDic = self.formDic;
        [cell textFieldAddObserver:self selector:@selector(textFieldValueChange:)];
        tableViewCell = cell;
    }
    if(model.cellType == CreateTableTVCell){
        FormTableTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableTVCellID"];
        cell.CreateTableModel = self.dataArray[indexPath.row];
        cell.formDic = self.formDic;
        [cell textFieldAddObserver:self selector:@selector(textFieldValueChange:)];
        tableViewCell = cell;
    }
    if(model.cellType == CreateTableSwitchCell){
        FormTableSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableSwitchCellID"];
        cell.CreateTableModel = model;
        cell.formDic = self.formDic;
        
        cell.SwitchClickBlock = ^(BOOL isSelect) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"FormSwitchBtnForm" object:nil];
        };
        tableViewCell = cell;
    }
    if(model.cellType == CreateTableSelectCell){
        FormTableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableSelectCellID"];
        cell.CreateTableModel = model;
        cell.formDic = self.formDic;
        
        [cell textFieldAddObserver:self selector:@selector(textFieldValueChange:)];
        tableViewCell = cell;
        
    }
    
    return tableViewCell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [[UITableViewHeaderFooterView alloc] init];
    [footerView addSubview:self.submitBtn];
    return footerView;
}

#pragma mark --------------------------------<UITableViewDelegate>------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==3){
        return 90;
    }else{
        return 45;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==2){//选择地址
        self.cover.hidden = !self.cover.hidden;
        self.chooseLocationView.hidden = self.cover.hidden;
        
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
    if (CGRectContainsPoint(_chooseLocationView.frame, point)){
        return NO;
    }
    return YES;
}

//点击遮罩层
- (void)tapCover:(UITapGestureRecognizer *)tap{
    
    if (_chooseLocationView.chooseFinish) {
        _chooseLocationView.chooseFinish();
    }
}



- (void)textFieldValueChange:(NSNotification *)note
{
    
    //可以这样取值
    NSString *name = self.formDic[@"name"];
    NSString *phone = self.formDic[@"phone"];
    NSString *dist = self.formDic[@"dist"];
    NSString *address = self.formDic[@"address"];
    
    NSLog(@"滑块：%@",self.formDic[@"state"]);
    
    if(name.length != 0 && phone.length != 0 && dist.length != 0 && address.length !=0){
        
    }else{
        
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
