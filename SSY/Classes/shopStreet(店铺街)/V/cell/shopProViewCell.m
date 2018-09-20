//
//  shopProViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/9.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopProViewCell.h"

#import "SquareCollectionViewFlowLayout.h"

//head
#import "shopHeadView.h"
//cell
#import "shopProItemCell.h"
//footer
#import "shopFooterView.h"


@interface shopProViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) SquareCollectionViewFlowLayout *squareLayout;
//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

@end


@implementation shopProViewCell

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpBaseUI];
    }
    return self;
}


#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        //        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.squareLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.frame = self.bounds;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        
        //注册head
        [_collectionView registerClass:[shopHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shopHeadViewID"];
        //注册cell
        [_collectionView registerClass:[shopProItemCell class] forCellWithReuseIdentifier:@"shopProItemCellID"];
        //注册footer
        [_collectionView registerClass:[shopFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"shopFooterViewID"];
    }
    return _collectionView;
}

-(SquareCollectionViewFlowLayout *)squareLayout
{
    if(!_squareLayout){
        _squareLayout = [[SquareCollectionViewFlowLayout alloc] init];
    }
    return _squareLayout;
}

-(void)setUpBaseUI{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
}


#pragma mark -<UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
//商店商品cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    shopProItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopProItemCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.proImageView.image = [UIImage imageNamed:@"00001"];
    return cell;
}
//head&&foot
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    //头部商家
    if(kind == UICollectionElementKindSectionHeader){
        shopHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shopHeadViewID" forIndexPath:indexPath];
        headView.shopIconView.image = [UIImage imageNamed:@"00001"];
        headView.shopNameLabel.text = @"西域美农";
//        headView.backgroundColor = [UIColor whiteColor];
        reusableView = headView;
        //进店看看
    }else if(kind == UICollectionElementKindSectionFooter){
        shopFooterView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"shopFooterViewID" forIndexPath:indexPath];
//        footView.backgroundColor = [UIColor whiteColor];
        reusableView = footView;
    }
    return reusableView;
}
//head高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenW, 50);
}
//foot高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenW, 40);
}
@end
