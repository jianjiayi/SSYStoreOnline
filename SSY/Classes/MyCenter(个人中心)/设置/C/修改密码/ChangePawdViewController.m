//
//  ChangePawdViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/29.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "ChangePawdViewController.h"

#import "FormTableModel.h"

#import "FormTableTFCell.h"

@interface ChangePawdViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;
//设置数据
@property(nonatomic,strong) NSMutableArray *dataArray;
//保存数据
@property(nonatomic,strong) NSMutableDictionary *formDict;

//footerView;
@property(nonatomic,strong) UIButton *submitBtn;

@end

@implementation ChangePawdViewController

#pragma mark - 懒加载
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        
        //注册
        [_tableView registerClass:[FormTableTFCell class] forCellReuseIdentifier:@"FormTableTFCellID"];
    }
    return _tableView;
}
-(UIButton *)submitBtn{
    if(!_submitBtn){
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(20, 40, ScreenW-40, 40);
        [_submitBtn setTitle:@"确认提交" forState:UIControlStateNormal];
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

#pragma mark -init
-(void)setUpBase{
    self.title = @"修改密码";
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.tableView];
    self.formDict = [NSMutableDictionary dictionary];
}


#pragma mark -创建数据
-(void)creatData{
    self.dataArray = @[].mutableCopy;
    
    FormTableModel *oldPawd = [FormTableModel new];
    oldPawd.cellType = CreateTableTFCell;
    oldPawd.title = @"原始密码";
    oldPawd.placeholder = @"请输入当前密码";
    oldPawd.key = @"oldPawd";
    [self.dataArray addObject:oldPawd];
    
    FormTableModel *firstPawd = [FormTableModel new];
    firstPawd.cellType = CreateTableTFCell;
    firstPawd.title = @"新密码";
    firstPawd.placeholder = @"输入密码";
    firstPawd.key = @"firstPawd";
    [self.dataArray addObject:firstPawd];
    
    FormTableModel *secondPawd = [FormTableModel new];
    secondPawd.cellType = CreateTableTFCell;
    secondPawd.title = @"确认密码";
    secondPawd.placeholder = @"请再次输入密码";
    
    secondPawd.key = @"secondPawd";
    [self.dataArray addObject:secondPawd];
    
    
}

#pragma mark ----------------------<UITableViewDataSource>-------------------------------------
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
    
    FormTableTFCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableTFCellID"];
    cell.creatTableModel = model;
    cell.formDict = self.formDict;
    [cell textFieldAddObserver:self selector:@selector(textFieldValueChange:)];
    tableViewCell = cell;
    
    return tableViewCell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *footerView = [[UITableViewHeaderFooterView alloc] init];
    [footerView addSubview:self.submitBtn];
    return footerView;
}

#pragma mark -----------------------<UITableViewDelegate>----------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//输入监听
- (void)textFieldValueChange:(NSNotification *)note
{
    
    UITextField *textField = note.object;
    //可以这样取值
    NSString *oldPawd = self.formDict[@"oldPawd"];
    NSString *firstPawd = self.formDict[@"firstPawd"];
    NSString *secondPawd = self.formDict[@"secondPawd"];
    
    if(oldPawd.length != 0 && firstPawd.length != 0 && secondPawd.length !=0){
        self.submitBtn.backgroundColor = MColor;
        self.submitBtn.userInteractionEnabled = YES;
    }else{
        self.submitBtn.backgroundColor = RGB(237, 237, 237);
        self.submitBtn.userInteractionEnabled = NO;
    }
    NSLog(@"saddj%@",oldPawd);
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
