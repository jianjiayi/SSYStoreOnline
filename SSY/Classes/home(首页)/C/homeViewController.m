//
//  homeViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "homeViewController.h"
//搜索页面
#import "SSYSearchViewController.h"
//分类页面
#import "SSYClassifyViewController.h"
//其他分类页面
#import "SSYOtherClassifyViewController.h"


//导航栏navbar
#import "homeTopToolView.h"
#import "homeNavgationBarView.h"
//banner轮播图head
#import "sliderShowView.h"
//九空格cell
#import "gridItemViewCell.h"

//热卖商品head
#import "hotGoodsHeadView.h"
//热卖商品cell
#import "hotGoodsView.h"

//店铺推荐head
#import "shopRecommendHeadView.h"
//店铺推荐cell
#import "shopRecommendView.h"

//为你推荐head
#import "recommendHeadView.h"
//为你推荐商品cell
#import "recommendGoodCell.h"


//刷新
#import "MJRefresh.h"


@interface homeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/*主页面collectionView*/
@property(nonatomic,strong) UICollectionView *collectionView;
/*导航栏工具*/
@property (nonatomic,strong) homeTopToolView *topToolView;

//九空格数据
@property(nonatomic,strong) NSMutableArray *gridArray;

@end

@implementation homeViewController

#pragma mark -懒加载 collectionView
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight-TabBarHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        
        /*注册cell*/
        [_collectionView registerClass:[gridItemViewCell class] forCellWithReuseIdentifier:@"gridItemViewCellID"];//九空格cell
        [_collectionView registerClass:[hotGoodsView class] forCellWithReuseIdentifier:@"hotGoodsViewID"];//热卖商品cell
        [_collectionView registerClass:[shopRecommendView class] forCellWithReuseIdentifier:@"shopRecommendViewID"];//店铺推荐
        [_collectionView registerClass:[recommendGoodCell class] forCellWithReuseIdentifier:@"recommendGoodsCellID"];//为你推荐cell
        
        /*注册header*/
        [_collectionView registerClass:[sliderShowView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sliderShowViewID"];//轮播图head
        [_collectionView registerClass:[hotGoodsHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hotGoodsHeadViewID"];//热卖商品head
        [_collectionView registerClass:[shopRecommendHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shopRecommendHeadViewID"];//店铺推荐head
        [_collectionView registerClass:[recommendHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"recommendHeadViewID"];//为你推荐head
        
        
        /*注册footer*/
        
        
        [self.view addSubview:_collectionView];
        
    }
    return _collectionView;
}


-(NSMutableArray *)gridArray
{
    if(!_gridArray){
        _gridArray = [[NSMutableArray alloc] init];
    }
    return _gridArray;
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
    //导航栏
    [self setUpNavTopView];
    //加载数据
    [self createData];
    
    //添加刷新方法
    [self createMJRefresh];
    //进入APP默认调用刷新方法
    [self.collectionView.header beginRefreshing];
}

//下拉刷新+上拉加载
- (void)createMJRefresh {
    __block homeViewController *weakself = self;
    [self.collectionView addLegendHeaderWithRefreshingBlock:^{
        NSLog(@"1111");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.collectionView.header endRefreshing];
        });
    }];
    [self.collectionView addLegendFooterWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.collectionView.footer endRefreshing];
            
        });
    }];
}


#pragma mark - collectionview基本和状态栏
-(void)setUpBase{
    self.collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - 导航栏
-(void)setUpNavTopView{
    _topToolView = [[homeTopToolView alloc] initWithFrame:CGRectMake(0, 0, ScreenW , TopHeight)];
    _topToolView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topToolView];
    WEAKSELF
    //点击消息按钮
    _topToolView.rightItemClickBlock = ^{
        NSLog(@"点击了消息按钮");
    };
    
    //点击搜索按钮
    _topToolView.searchButtonClickBlock = ^{
        NSLog(@"点击搜索按钮");
        SSYSearchViewController *searchVC = [[SSYSearchViewController alloc] init];
        NavBarViewController *nav = [[NavBarViewController alloc] initWithRootViewController:searchVC];
        [weakSelf presentViewController:nav animated:NO completion:nil];
    };
}

-(void)createData{
    NSArray *NtGridArray = @[@{@"id":@"0001",@"url":@"icon_grid01@2x",@"name":@"新鲜水果"},
                             @{@"id":@"0002",@"url":@"icon_grid02@2x",@"name":@"蔬菜豆类"},
                             @{@"id":@"0003", @"url":@"icon_grid03@2x",@"name":@"肉蛋类"},
                             @{@"id":@"0004",@"url":@"icon_grid04@2x",@"name":@"米面粮油"},
                             @{@"id":@"0005",@"url":@"icon_grid05@2x",@"name":@"海鲜水产"},
                             @{@"id":@"0006",@"url":@"icon_grid06@2x",@"name":@"地方特产"},
                             @{@"id":@"0007",@"url":@"icon_grid07@2x",@"name":@"休闲食品"},
                             @{@"id":@"0008",@"url":@"icon_grid08@2x",@"name":@"分类"}];
    for (int i = 0; i < NtGridArray.count; i++) {
        SSYGridItemModel *item = [[SSYGridItemModel alloc] init];
        item.gridID = NtGridArray[i][@"id"];
        item.iconName = NtGridArray[i][@"name"];
        item.iconUrl = NtGridArray[i][@"url"];
        NSLog(@"sdfasf");
        [self.gridArray addObject:item];
    }
}

#pragma mark - UICollectionViewDataSource
//共有6组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

//每组多少cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){//九空格
        return self.gridArray.count;
    }
    if(section == 1){//热卖商品
        return 1;
    }
    if(section == 3){//店铺推荐
        return 1;
    }
    if(section == 4){//为你推荐
        return 20;
    }
    return 0;
}

//定义cell的样式cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *girdcell = nil;
    if(indexPath.section==0){//九空格
        gridItemViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gridItemViewCellID" forIndexPath:indexPath];
        SSYGridItemModel *model = self.gridArray[indexPath.row];
        
        cell.GridItemModel = model;
        cell.tagLabel.hidden = YES;
        cell.backgroundColor = [UIColor whiteColor];
        girdcell = cell;
        
    }
    if(indexPath.section == 1){//热卖商品
        hotGoodsView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotGoodsViewID" forIndexPath:indexPath];
        girdcell = cell;
    }
    if(indexPath.section == 3){//店铺推荐
        shopRecommendView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopRecommendViewID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        girdcell = cell;
    }
    if(indexPath.section==4){//为你推荐
        recommendGoodCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendGoodsCellID" forIndexPath:indexPath];
        cell.goodsImageView.image = [UIImage imageNamed:@"00001"];
        cell.backgroundColor = [UIColor redColor];
        cell.goodsLabel.text = @"撒娇的你就爱上你的叫法是的方式结案的法律惊世毒妃";
        cell.priceLabel.text = @"190.00";
        cell.btnGroup.tag = 10000;
        cell.moreBtn.tag = 10000;
        [cell.moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        girdcell = cell;
    }
    return girdcell;
}
//header/footer
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    //头部
    if(kind == UICollectionElementKindSectionHeader){
        if(indexPath.section == 0){//轮播图
            sliderShowView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sliderShowViewID" forIndexPath:indexPath];
            headerView.imageArray = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
            reusableview = headerView;
        }
        if(indexPath.section == 1){//热卖商品title
            hotGoodsHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hotGoodsHeadViewID" forIndexPath:indexPath];
            headerView.titleImageView.image = [UIImage imageNamed:@"SYrmsp_title@2x"];
            headerView.backgroundColor = [UIColor whiteColor];
            reusableview = headerView;
        }
        if(indexPath.section == 3){//店铺推荐title
            shopRecommendHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shopRecommendHeadViewID" forIndexPath:indexPath];
            headerView.titleImageView.image = [UIImage imageNamed:@"SYdptj_title@2x"];
            headerView.backgroundColor = [UIColor whiteColor];
            reusableview = headerView;
        }
        if(indexPath.section == 4){//为你推荐title
            recommendHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"recommendHeadViewID" forIndexPath:indexPath];
            headerView.titleImgaeView.image = [UIImage imageNamed:@"SYwntj_title@2x"];
            headerView.backgroundColor = [UIColor whiteColor];
            reusableview = headerView;
        }
        
    }
    //尾部
    if(kind == UICollectionElementKindSectionFooter){
        
    }
    
    
    return reusableview;
}

#pragma mark - header宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if(section == 0){//轮播图
        return CGSizeMake(ScreenW, ScreenW*0.32);
    }
    if(section == 1){//热卖商品
        return CGSizeMake(ScreenW, 50);
    }
    
    if(section == 3){//店铺推荐
        return CGSizeMake(ScreenW, 50);
    }
    
    if(section == 4){//为你推荐
        return CGSizeMake(ScreenW, 50);
    }
    return CGSizeZero;
}

#pragma mark - footer间距
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    return CGSizeZero;
}
#pragma mark - 定义每个section的四边距离，分别 上、左、下、右
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section == 0){
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    if(section == 1){
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    if(section == 3){
        return UIEdgeInsetsMake(0, 0, 10, 0);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark - item宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){//九空格
        return CGSizeMake(ScreenW/4, ScreenW/4);
    }
    
    if(indexPath.section == 1){//热卖商品
        return CGSizeMake(ScreenW, 200);
    }
    
    if(indexPath.section == 3){//店铺推荐
        return CGSizeMake(ScreenW, ScreenW*0.64);
    }
//
    if(indexPath.section == 4){//为你推荐商品
        return CGSizeMake((ScreenW-8)/2, (ScreenW-8)/2+70);
    }
    return CGSizeZero;
}



#pragma mark - Y轴方向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if(section == 3){
        return 8;
    }
    if(section == 4){
        return 8;
    }
    return 0;
}
#pragma mark - X轴方向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 3){
        return 8;
    }
    if(section == 4){
        return 8;
    }
    return 0;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            if(indexPath.row !=7){
                SSYOtherClassifyViewController *otherClassifyVc = [[SSYOtherClassifyViewController alloc] init];
                
                SSYGridItemModel *model = self.gridArray[indexPath.row];
                otherClassifyVc.title = model.iconName;
                
                [self.navigationController pushViewController:otherClassifyVc animated:YES];
            }else{
                SSYClassifyViewController *classifyVc = [[SSYClassifyViewController alloc] init];
                [self.navigationController pushViewController:classifyVc animated:YES];
            }
            break;
            
        default:
            break;
    }
}




//点击morrBtn
-(void)moreBtnClick:(id)sender{
    
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
