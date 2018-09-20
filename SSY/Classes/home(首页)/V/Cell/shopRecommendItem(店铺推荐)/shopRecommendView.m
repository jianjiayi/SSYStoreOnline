//
//  shopRecommendView.m
//  SSY
//
//  Created by 大为科技 on 2018/7/31.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopRecommendView.h"

#import "shopRecommendOneCell.h"
#import "shopRecommendTwoCell.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface shopRecommendView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

@end


@implementation shopRecommendView

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        _collectionView.frame = self.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //注册cell
        [_collectionView registerClass:[shopRecommendOneCell class] forCellWithReuseIdentifier:@"shopRecommendOneCellID"];
        [_collectionView registerClass:[shopRecommendTwoCell class] forCellWithReuseIdentifier:@"shopRecommendTwoCellID"];
        
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

#pragma mark - <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     UICollectionViewCell *gridCell = nil;
    if(indexPath.section ==0 ){
        shopRecommendOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopRecommendOneCellID" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"00001"];
        gridCell = cell;
    }else if(indexPath.section == 1){
        shopRecommendTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopRecommendTwoCellID" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"00001"];
        gridCell = cell;
    }
    return gridCell;
}

//cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
    }
    if(indexPath.section==1){
        return CGSizeMake(ScreenW/2-2 , ScreenW*0.384);
    }
    return CGSizeZero;
}

//店铺推荐cell大小
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            layoutAttributes.size = CGSizeMake(ScreenW*0.6-1, ScreenW*0.24);
        }else if(indexPath.row == 1){
            layoutAttributes.size = CGSizeMake(ScreenW*0.4-1, ScreenW*0.24);
        }
    }
    return layoutAttributes;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
//cell水平间距
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if(section == 0){
        return 2;
    }
    if(section == 1){
        return 4;
    }
    return 0;
}
//cell垂直间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSLog(@"点击店铺推荐第一组%zd",indexPath.row);
        
    }else if(indexPath.section == 1){
        NSLog(@"点击店铺推荐第二组%zd",indexPath.row);
    }
    
}

@end
