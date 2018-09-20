//
//  SSYOtherClassifyViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyViewController.h"

//轮播图
#import "SSYOtherClassifyBannerHeadView.h"

//每日优选head
#import "SSYOtherClassifyDaySelectHeadView.h"

//每日优选cell
#import "SSYOtherClassifyDaySelectView.h"

//按钮listMenu
#import "SSYOtherClassifyMenuListHeadView.h"
//商品列表
#import "SSYProductListItemCell.h"

@interface SSYOtherClassifyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation SSYOtherClassifyViewController

#pragma mark 懒加载
-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //注册header
        [_collectionView registerClass:[SSYOtherClassifyBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyBannerHeadViewID"];
        [_collectionView registerClass:[SSYOtherClassifyDaySelectHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyDaySelectHeadViewID"];
        [_collectionView registerClass:[SSYOtherClassifyMenuListHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyMenuListHeadViewID"];
        //注册cell
        [_collectionView registerClass:[SSYOtherClassifyDaySelectView class] forCellWithReuseIdentifier:@"SSYOtherClassifyDaySelectViewID"];
        [_collectionView registerClass:[SSYProductListItemCell class] forCellWithReuseIdentifier:@"SSYProductListItemCellID"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
}

-(void)setUpBase{
    self.view.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:self.collectionView];
}



#pragma mark --------------------------<UICollectionViewDataSource>------------------------------------------------------------
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 1){
        return 1;
    }
    if(section ==2){
        return 20;
    }
    return 0;
}
//head
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if(kind == UICollectionElementKindSectionHeader){
        if(indexPath.section == 0){
            SSYOtherClassifyBannerHeadView *bannerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyBannerHeadViewID" forIndexPath:indexPath];
            bannerView.imgUrl = @"00002";
            reusableView = bannerView;
        }
        if(indexPath.section == 1){
            SSYOtherClassifyDaySelectHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyDaySelectHeadViewID" forIndexPath:indexPath];
            headView.backgroundColor = [UIColor whiteColor];
            reusableView = headView;
        }
        if(indexPath.section == 2){
            SSYOtherClassifyMenuListHeadView *menuHeadView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSYOtherClassifyMenuListHeadViewID" forIndexPath:indexPath];
            menuHeadView.backgroundColor = [UIColor whiteColor];
            reusableView = menuHeadView;
        }
    }
    return reusableView;
}
//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *collectionCell = nil;
    if(indexPath.section == 1){
        SSYOtherClassifyDaySelectView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSYOtherClassifyDaySelectViewID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        collectionCell = cell;
    }
    if(indexPath.section == 2){
        SSYProductListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSYProductListItemCellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        collectionCell = cell;
    }
    return collectionCell;
}

#pragma mark ---------------------------<UICollectionViewDelegate>--------------------------------------------------------
//header大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return CGSizeMake(ScreenW, 120);
    }
    if(section == 1){
        return CGSizeMake(ScreenW, 40);
    }
    if(section == 2){
        return CGSizeMake(ScreenW, 40);
    }
    return CGSizeZero;
}
//cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        return CGSizeMake(ScreenW, 160);
    }
    if(indexPath.section == 2){
        return CGSizeMake(ScreenW/2-2, (ScreenW/2-2)+70);
    }
    return CGSizeZero;
}
//Y间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if(section ==1){
        
    }
    if(section == 2){
        return 4;
    }
    return 0;
}
//X间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section ==1){
        
    }
    if(section == 2){
        return 4;
    }
    return 0;
    
}

#pragma mark - 定义每个section的四边距离，分别 上、左、下、右
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section == 1){
        return UIEdgeInsetsMake(5, 0, 5, 0);
    }
    if(section == 2){
        return UIEdgeInsetsMake(6, 0, 0, 0);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
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
