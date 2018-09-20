//
//  SSYSearchResultViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/10.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYSearchResultViewController.h"

//头部
#import "SSYSearchResultHeadView.h"

//cell
#import "SSYSearchResultCollectionViewCell.h"

//数据模型
#import "SSYSearchResultModel.h"


@interface SSYSearchResultViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation SSYSearchResultViewController

{
    BOOL _isGrid;
}

#pragma mark -懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, TopHeight+45, ScreenW, ScreenH-TopHeight-45);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        //注册
        [_collectionView registerClass:[SSYSearchResultCollectionViewCell class] forCellWithReuseIdentifier:@"SSYSearchResultCollectionViewCellID"];
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
    
    [self setUpNavBar];
    
    [self setUpHeader];
    
    [self setUpUI];
    
    _isGrid = NO;
}

-(void)setUpNavBar{
    
}

-(void)setUpHeader{
    SSYSearchResultHeadView *headView = [[SSYSearchResultHeadView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, 45)];
    headView.backgroundColor = [UIColor whiteColor];
    //事件分离
    [self clickHeadView:headView];
    
    [self.view addSubview:headView];
}

-(void)setUpUI{
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.collectionView];
}

#pragma mark ---------------------<UICollectionViewDataSource>----------------------------------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridCell;
    SSYSearchResultModel *model = [SSYSearchResultModel new];
    
    SSYSearchResultCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSYSearchResultCollectionViewCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titileLabel.text = @"sadjad四大皆空撒大声地法师打发后谁都不发士大夫把话说的发生的合法巴萨的办法哈三点半防守打法";
    cell.postageLabel.text = @"包邮";
    cell.priceLabel.text = @"31.2";
    cell.shopNameLabel.text = @"菅双鹏-和北欧";
    cell.isGrid = _isGrid;
    
    //事件分离
    [self clickCellView:cell resultModel:model indexPath:indexPath];
    
    gridCell = cell;
    return gridCell;
}

#pragma mark ---------------------<UICollectionViewDelegate>-----------------------------------
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(_isGrid){
        return CGSizeMake(ScreenW/2-3, 300);
    }else{
        return CGSizeMake(ScreenW-2, 120);
    }
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if(_isGrid){
        return 6;
    }else{
        return 0;
    }
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if(_isGrid){
        return 6;
    }else{
        return 0;
    }
}

//header点击事件
-(void)clickHeadView:(SSYSearchResultHeadView *)headView{
    headView.ComprehensiveClickBlock = ^{
        NSLog(@"综合排序查询");
    };
    
    headView.SalesVolumeClickBlock = ^{
        NSLog(@"销量排序查询");
    };
    
    headView.PriceUpDownClickBlock = ^(BOOL isSelect) {
        //0:降序；1:升序
        NSLog(@"价格排序查询: %d",isSelect);
    };
    
    headView.GridClickBlock = ^(BOOL isSelect) {
        NSLog(@"排版切换:%d",isSelect);
        if(isSelect){
            _isGrid = YES;
        }else{
            _isGrid = NO;
        }
        [self.collectionView reloadData];
    };
}

//cell点击事件
-(void)clickCellView:(SSYSearchResultCollectionViewCell *)cell
         resultModel:(SSYSearchResultModel *)resultModel
           indexPath:(NSIndexPath *)indexPath
{
    cell.GoShopClickBlock = ^(NSString *shopID) {
        NSLog(@"进入商家店铺");
    };
    
    cell.AddCartClickBlock = ^(NSString *proID) {
        NSLog(@"加入购物车");
    };
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
