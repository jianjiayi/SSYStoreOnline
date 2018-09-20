//
//  mineViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineViewController.h"

#import "SSYOrdersViewController.h"

//导航栏
#import "mineTopToolView.h"

//header
#import "mineHeadView.h"
//我的订单head
#import "mineOrdersHeadView.h"
//我的订单状态cell
#import "mineOrderItemCell.h"
//base九空格
#import "mineBaseItemView.h"

//设置
#import "SettingViewController.h"



@interface mineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,strong) mineTopToolView *navBarView;//导航栏

@property(nonatomic,strong) UIImageView *headerBgImageView;//顶部背景图片

//我的订单
@property(nonatomic,strong) NSMutableArray *orderItemArray;

@end

@implementation mineViewController


#pragma mark -懒加载cellectionView
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight-TabBarHeight);
        _collectionView.contentOffset = CGPointMake(0, -0);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        //注册header
        [_collectionView registerClass:[mineHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeadViewID"];
        [_collectionView registerClass:[mineOrdersHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineOrdersHeadViewID"];
        
        //注册cell
        [_collectionView registerClass:[mineOrderItemCell class] forCellWithReuseIdentifier:@"mineOrderItemCellID"];
        
        //注册footer
        [_collectionView registerClass:[mineBaseItemView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"mineBaseItemViewID"];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
#pragma mark -懒加载顶部背景图片
-(UIImageView *)headerBgImageView
{
    if(!_headerBgImageView){
        _headerBgImageView = [[UIImageView alloc] init];
        _headerBgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerBgImageView.clipsToBounds = YES;
        [_headerBgImageView setImage:[UIImage imageNamed:@"MYheader_bg"]];
        _headerBgImageView.backgroundColor = [UIColor grayColor];
        _headerBgImageView.frame = CGRectMake(0, 0, ScreenW, ScreenW*0.4+StatusBarHeight);
        
    }
    return _headerBgImageView;
}

-(NSMutableArray *)orderItemArray{
    if(!_orderItemArray){
        _orderItemArray = [[NSMutableArray alloc] init];
    }
    return _orderItemArray;
}


//在当前页面加入下面方法
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;//修改状态转台
    [self.navigationController setNavigationBarHidden:YES animated:animated];//隐藏导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//如果仅设置当前页导航透明，需加入下面方法
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;//修改状态转台
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    [self setUpNavBar];
    
    [self createData];
}

#pragma mark -  初始化
-(void)setUpBase{
    //添加 顶部背景
    [self.view insertSubview:self.headerBgImageView atIndex:0];
    //添加collectionview
    [self.view addSubview:self.collectionView];
    
}

#pragma mark - 设置导航栏
-(void)setUpNavBar{
    _navBarView = [mineTopToolView new];
    _navBarView.frame = CGRectMake(0, StatusBarHeight, ScreenW, NavBarHeight);
    _navBarView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_navBarView];
    
    WEAKSELF
    self.navBarView.SettingClickBlock = ^{
        NSLog(@"点击了设置");
        SettingViewController *settingVC = [[SettingViewController alloc] init];
        [weakSelf.navigationController pushViewController:settingVC animated:YES];
    };
    self.navBarView.MessageClickBlock = ^{
        NSLog(@"点击了消息");
    };
}

//加载图标
-(void)createData{
    
    NSArray *data1 = @[@{@"url":@"MYdfk_icon",@"name":@"待付款",@"id":@"1"},
                       @{@"url":@"MYdfh_icon",@"name":@"待发货",@"id":@"2"},
                       @{@"url":@"MYdsh_icon",@"name":@"待收货",@"id":@"3"},
                       @{@"url":@"MYdpj_icon",@"name":@"待评价",@"id":@"4"},
                       @{@"url":@"MYtk_icon",@"name":@"退款/售后",@"id":@"5"}];
    
    for (int i = 0; i < data1.count; i++) {
        SSYMineOrderItemModel *item = [[SSYMineOrderItemModel alloc] init];
        item.iconUrl = data1[i][@"url"];
        item.iconName = data1[i][@"name"];
        [self.orderItemArray addObject:item];
    }
}

#pragma mark - <UICollectionViewDataSourece>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 1){
        return self.orderItemArray.count;
    }
    if(section == 2){
        return 1;
    }
    return 0;
}
//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *girdCell = nil;
    if(indexPath.section==1){
        mineOrderItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineOrderItemCellID" forIndexPath:indexPath];
        SSYMineOrderItemModel *model = self.orderItemArray[indexPath.row];
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.orderItemModel = model;
        
        girdCell = cell;
    }
    return girdCell;
}
//header
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableHeadView = nil;
    if(kind == UICollectionElementKindSectionHeader){
        if(indexPath.section==0){
            mineHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeadViewID" forIndexPath:indexPath];
            headView.layer.backgroundColor = [UIColor clearColor].CGColor;
            headView.loginClickBlock = ^{
                loginViewController *loginVC = [[loginViewController alloc] init];
                NavBarViewController *loginNav = [[NavBarViewController alloc]initWithRootViewController:loginVC];
//                [self.navigationController pushViewController:loginNav animated:YES];
                [self presentViewController:loginNav animated:YES completion:nil];
            };
            reusableHeadView = headView;
        }
        if(indexPath.section == 1){
            mineOrdersHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineOrdersHeadViewID" forIndexPath:indexPath];
            headView.backgroundColor = [UIColor whiteColor];
            headView.AllOrderClickBlock = ^{
                SSYOrdersViewController *orderVC = [[SSYOrdersViewController alloc] init];
                [self.navigationController pushViewController:orderVC animated:YES];
            };
            reusableHeadView = headView;
        }
    }
    if(kind == UICollectionElementKindSectionFooter){
        if(indexPath.section == 1){
            mineBaseItemView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"mineBaseItemViewID" forIndexPath:indexPath];
            footerView.backgroundColor = [UIColor whiteColor];
            reusableHeadView = footerView;
        }
    }
    return reusableHeadView;
}
//cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1){
        return CGSizeMake(ScreenW/5, ScreenW/5+0);
    }
    return CGSizeZero;
}

//header高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return CGSizeMake(ScreenW,ScreenW*0.4 - NavBarHeight +30);
    }
    if(section == 1){
        return CGSizeMake(ScreenW, 50);
    }
    return CGSizeZero;
}

//footer高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if(section == 1){
        return CGSizeMake(ScreenW, 170);
    }
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
//cell x周间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//cell y周间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//设置section内边距
#pragma mark - 定义每个section的四边距离，分别 上、左、下、右
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 10, 0);
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
