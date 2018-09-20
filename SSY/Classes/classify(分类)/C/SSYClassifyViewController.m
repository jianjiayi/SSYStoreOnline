//
//  SSYClassifyViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYClassifyViewController.h"

//左侧tableViewcell
#import "SSYClassifyLeftTableViewCell.h"
//右侧collectionViewCell
#import "SSYClassifyRightCollectionViewCell.h"


@interface SSYClassifyViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//tableView
@property(nonatomic,strong) UITableView *tableView;
//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

//左侧数据源
@property(nonatomic,strong) NSMutableArray *dataList;
//右边数据源
@property(nonatomic,strong) NSMutableArray *allRightDataList;
//右边列表过滤数据
@property(nonatomic,strong) NSMutableArray *rightDataList;
//当前被左侧选中的ID数据
@property(nonatomic,strong) SSYClassifyLeftModel *curSelectModel;

//判断左侧是否滚动底部
@property(nonatomic,assign) BOOL currentIsInBottom;

//是否保持右边滚动时位置
@property(nonatomic,assign) BOOL isKeepScrollState;
@property(nonatomic,assign) BOOL isReturnLastOffset;
//选择index
@property(nonatomic,assign) NSInteger selectIndex;

@end

@implementation SSYClassifyViewController

#pragma mark - 懒加载
-(UITableView *)tableView
{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight, 90, ScreenH-TopHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = RGB(244, 244, 2);
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, CGFLOAT_MIN)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, CGFLOAT_MIN)];
        
        //注册cell
        [_tableView registerClass:[SSYClassifyLeftTableViewCell class] forCellReuseIdentifier:@"SSYClassifyLeftTableViewCellID"];
        
    }
    return _tableView;
}

-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(90, TopHeight, ScreenW-90, ScreenH-TopHeight);
        _collectionView.backgroundColor = [UIColor whiteColor];
        //注册cell
        [_collectionView registerClass:[SSYClassifyRightCollectionViewCell class] forCellWithReuseIdentifier:@"SSYClassifyRightCollectionViewCellID"];
        
    }
    return _collectionView;
}

//在当前页面加入下面方法
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInit];
    
    [self createData];
    
    [self setUpUI];
    
    [self setLeftDefualtData];
}
//初始化
-(void)setInit{
    self.dataList = [[NSMutableArray alloc] init];
    self.allRightDataList = [[NSMutableArray alloc] init];
    self.rightDataList = [[NSMutableArray alloc] init];
    self.isReturnLastOffset = YES;
    self.isKeepScrollState = YES;
    
    self.currentIsInBottom = NO;
    
    self.selectIndex = 0;
}

//加载数据
-(void)createData{
    for (int i = 0; i <= 20; i++) {
        //左侧数据
        SSYClassifyLeftModel *item = [[SSYClassifyLeftModel alloc] init];
        item.tagID = i;
        item.tagName = [NSString stringWithFormat:@"第 %d 层",i];
        [self.dataList addObject:item];
        
        for (int j = 0; j < 24; j++) {
            SSYCliassifyRightModel *model = [[SSYCliassifyRightModel alloc] init];
            model.roomImgUrl = @"00001";
            model.tagID = i;
            model.roomID = j;
            model.roomName = [NSString stringWithFormat:@"%d 层房间 %d",i,j];
            [self.allRightDataList addObject:model];
        }
    }
}
//创建页面
-(void)setUpUI{
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
}
//加载左侧数据
-(void)setLeftDefualtData{
    if(self.dataList.count > 0){
        self.curSelectModel = [self.dataList objectAtIndex:self.selectIndex];
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        [self.tableView reloadData];
        
        
        //右边加载数据
        [self predicateDataSoure];
    }
}

//过滤右边数据
-(void)predicateDataSoure{
    NSPredicate *pre = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"tagID=%ld",self.curSelectModel.tagID]];
    self.rightDataList = [[self.allRightDataList filteredArrayUsingPredicate:pre] mutableCopy];
    [self.collectionView reloadData];
}




#pragma mark -------------------------<UITableViewDataSource,UICollectionViewDataSource>---------------------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableCell = nil;
    SSYClassifyLeftModel *model = self.dataList[indexPath.row];
    
    SSYClassifyLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SSYClassifyLeftTableViewCellID"];
    cell.backgroundColor = RGB(244, 244, 244);
    
    cell.curLeftTagModel = model;
    cell.hasBeenSelected = (cell.curLeftTagModel == self.curSelectModel);
    
    tableCell = cell;
    return tableCell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.rightDataList.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *collectionCell = nil;
    SSYCliassifyRightModel *model = self.rightDataList[indexPath.row];
    
    SSYClassifyRightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSYClassifyRightCollectionViewCellID" forIndexPath:indexPath];
    cell.curNoHeadRightModel = model;
    
    collectionCell = cell;
    return collectionCell;
}

#pragma mark --------------------------<UITableViewDelegate,UICollectionViewDelegate>-------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//Y
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//X
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat _width;
    _width = (ScreenW-90)/3;
    return CGSizeMake(_width, _width+40);
}


//记录滚动位置    右边列表的当前滚动位置记录下来，存在左边数据源的实体中，然后在左边的列表点击事件中进行判断
#pragma mark---记录滑动的坐标(把右边滚动的Y值记录在列表的一个属性中)
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if([scrollView isEqual:self.collectionView]){
        self.isReturnLastOffset = YES;
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if([scrollView isEqual:self.collectionView]){
        SSYClassifyLeftModel *item = self.dataList[self.selectIndex];
        item.offsetScorller = scrollView.contentOffset.y;
        self.isReturnLastOffset = NO;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([scrollView isEqual:self.collectionView]){
        SSYClassifyLeftModel *item = self.dataList[self.selectIndex];
        item.offsetScorller = scrollView.contentOffset.y;
        self.isReturnLastOffset = NO;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isEqual:self.collectionView] && self.isReturnLastOffset){
        SSYClassifyLeftModel *item = self.dataList[self.selectIndex];
        item.offsetScorller = scrollView.contentOffset.y;
    }
    if([scrollView isEqual:self.tableView]){
        CGFloat height = scrollView.frame.size.height;
        NSLog(@"asdfawdf111:%f",height);
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        NSLog(@"sadfade222:%f",contentOffsetY);
        CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
        NSLog(@"sdafasdf333:%f",bottomOffset);
        if (bottomOffset <= height)
        {
            //在最底部
            self.currentIsInBottom = YES;
        }
        else
        {
            self.currentIsInBottom = NO;
        }
    }
}



//左侧tableView点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectIndex = indexPath.section;
    self.curSelectModel = self.dataList[indexPath.row];
    
    [self.tableView reloadData];
    
    [self predicateDataSoure];
    
    //处理点击在滚动置顶问题
    if(!self.currentIsInBottom){
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    }
    
    
    self.isReturnLastOffset = NO;
    
    if(self.isKeepScrollState){
        
        [self.collectionView scrollRectToVisible:CGRectMake(0, self.curSelectModel.offsetScorller, self.collectionView.frame.size.width, self.collectionView.frame.size.height) animated:YES];
    }else{
        [self.collectionView scrollRectToVisible:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height) animated:NO];
    }
}

//右侧collectionView点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SSYCliassifyRightModel *model = self.rightDataList[indexPath.row];
    NSLog(@"您选择了%@",model.roomName);
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
