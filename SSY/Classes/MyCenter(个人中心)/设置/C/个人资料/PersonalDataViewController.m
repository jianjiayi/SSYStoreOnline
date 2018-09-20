//
//  PersonalDataViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/28.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "PersonalDataViewController.h"

#import "FormTableImageCell.h"

#import "FormTableSelectCell.h"

#import "FormTableModel.h"

//修改昵称
#import "ModifyNicknameViewController.h"

@interface PersonalDataViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) NSDictionary *formDic;

@end

@implementation PersonalDataViewController

#pragma mark -懒加载
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.scrollEnabled = NO;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, CGFLOAT_MIN)];
        //cell
        [_tableView registerClass:[FormTableImageCell class] forCellReuseIdentifier:@"FormTableImageCellID"];
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
    self.title = @"个人资料";
    self.view.backgroundColor = RGB(244, 244, 244);
    
    [self.view addSubview:self.tableView];
    
    self.formDic = [NSMutableDictionary dictionary];
}

-(void)createData{
    _dataArray = @[].mutableCopy;
    
    FormTableModel *headImg = [FormTableModel new];
    headImg.cellType = CreateTablePhotoCell;
    headImg.title = @"头像";
    headImg.imgURL = @"headImgBg_icon";
    headImg.key = @"headImg";
    [self.dataArray addObject:headImg];
    
    FormTableModel *name = [FormTableModel new];
    name.cellType = CreateTableSelectCell;
    name.title = @"昵称";
    name.placeholder = @"13121378101";
    name.key = @"nickName";
    [self.dataArray addObject:name];
    
    FormTableModel *sex = [FormTableModel new];
    sex.cellType = CreateTableSelectCell;
    sex.title = @"性别";
    sex.placeholder = @"男";
    sex.key = @"sex";
    [self.dataArray addObject:sex];
}

#pragma mark ----------------------<UITableViewDataSource>-----------------------------------
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
    if(model.cellType == CreateTablePhotoCell){
        FormTableImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableImageCellID"];
        cell.CreateTableModel = model;
        tableViewCell = cell;
    }else{
        FormTableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormTableSelectCellID"];
        cell.CreateTableModel = model;
        tableViewCell = cell;
    }
    return tableViewCell;
}

#pragma mark ----------------------<UITableViewDelegate>-----------------------------------

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row ==0){
        return 50;
    }else{
        return 40;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if(indexPath.row==0){//修改头像
        
    }
    if(indexPath.row==1){//修改昵称
        ModifyNicknameViewController *modifyNicknameVC = [[ModifyNicknameViewController alloc] init];
        modifyNicknameVC.nickNameTextField.text = @"1111111111r";
        [self.navigationController pushViewController:modifyNicknameVC animated:YES];
    }
    if(indexPath.row==2){//修改性别
        
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
