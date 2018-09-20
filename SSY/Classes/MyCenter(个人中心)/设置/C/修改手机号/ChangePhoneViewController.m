//
//  ChangePhoneViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/29.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "ChangePhoneViewController.h"

#import "FormTableModel.h"

#import "FormTableTFCell.h"

#import "FormTableCodeCell.h"

@interface ChangePhoneViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;
//提示
@property(nonatomic,strong) UILabel *tipsLabel;

@property(nonatomic,strong) UIButton *submitBtn;

//设置数据
@property(nonatomic,strong) NSMutableArray *dataArray;
//保存数据
@property(nonatomic,strong) NSMutableDictionary *formDict;

@end

@implementation ChangePhoneViewController

#pragma mark - 懒加载
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight+40, ScreenW, ScreenH-TopHeight-40) style:UITableViewStyleGrouped];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        //注册
        [_tableView registerClass:[FormTableTFCell class] forCellReuseIdentifier:@"FormTableTFCellID"];
        [_tableView registerClass:[FormTableCodeCell class] forCellReuseIdentifier:@"FormTableCodeCellID"];
    }
    return _tableView;
}

-(UILabel *)tipsLabel{
    if(!_tipsLabel){
        _tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, TopHeight, ScreenW-30, 40)];
        _tipsLabel.text = @"输入你要更改的手机号";
        _tipsLabel.font = PFR12Font;
        _tipsLabel.textColor = RGB(155, 155, 155);
    }
    return _tipsLabel;
}

-(UIButton *)submitBtn{
    if(!_submitBtn){
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(20, 40, ScreenW-40, 40);
        [_submitBtn setTitle:@"确认修改" forState:UIControlStateNormal];
        [_submitBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        _submitBtn.backgroundColor = RGB(237, 237, 237);
        _submitBtn.layer.cornerRadius = 20;
        _submitBtn.userInteractionEnabled = NO;
        _submitBtn.titleLabel.font = PFR14Font;
    }
    return _submitBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self creatData];
}

//初始化
-(void)setUpBase{
    self.title = @"修改手机号";
    
    self.view.backgroundColor = RGB(244, 244, 244);
    
    [self.view addSubview:self.tipsLabel];
    
    [self.view addSubview:self.tableView];
    //初始化一个空的可变字典
    self.formDict = [NSMutableDictionary dictionary];
    
}
//设置模型
-(void)creatData{
    self.dataArray = @[].mutableCopy;
    
    FormTableModel *phone = [FormTableModel new];
    phone.cellType = CreateTableTFCell;
    phone.title = @"手机号:";
    phone.placeholder = @"请输入手机号";
    phone.key = @"phone";
    [self.dataArray addObject:phone];
    
    FormTableModel *codeNum = [FormTableModel new];
    codeNum.cellType = CreateTableButtonCell;
    codeNum.placeholder = @"请输入验证码";
    codeNum.key = @"codeNum";
    [self.dataArray addObject:codeNum];
    
    FormTableModel *pawd = [FormTableModel new];
    pawd.cellType = CreateTableTFCell;
    pawd.title = @"登录密码:";
    pawd.placeholder = @"请输入登录密码";
    pawd.key = @"password";
    [self.dataArray addObject:pawd];
    
}

#pragma mark ------------------------<UITableViewDataSource>--------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FormTableModel *model = self.dataArray[indexPath.row];
    UITableViewCell *tableViewCell = nil;
    
    if(model.cellType == CreateTableButtonCell){
        FormTableCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableCodeCellID"];
        cell.creatTableModel = model;
        cell.formDict = self.formDict;
        [cell textFieldAddObserver:self selector:@selector(textFieldValueChange:)];
        cell.GetCodeClickBlock = ^{
            NSLog(@"获取验证码");
            [self getCodeClick:self.formDict[@"phone"]];
        };
        
        
        tableViewCell = cell;
    }else{
        FormTableTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableTFCellID"];
        cell.creatTableModel = model;
        cell.formDict = self.formDict;
        
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


#pragma mark ------------------------<UITableViewDelegate>--------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



- (void)textFieldValueChange:(NSNotification *)note
{
    
    //可以这样取值
    NSString *phone = self.formDict[@"phone"];
    NSString *codeNum = self.formDict[@"codeNum"];
    NSString *password = self.formDict[@"password"];
    
    if(phone.length != 0 && codeNum.length != 0 && password.length !=0){
        self.submitBtn.backgroundColor = MColor;
        self.submitBtn.userInteractionEnabled = YES;
    }else{
        self.submitBtn.backgroundColor = RGB(237, 237, 237);
        self.submitBtn.userInteractionEnabled = NO;
    }
    
}
//获取验证码
-(void)getCodeClick:(NSString *)sender{
//    NSLog(sender);
    NSString *phone = self.formDict[@"phone"];
    if(phone.length != 0){
        //获取验证码
        
        
        
        //通知倒计时
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ThisIsANoticafication" object:nil];
    }
    
}



//因为监听了textField通知，所以记得要在注销时，注销通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


//关闭键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
