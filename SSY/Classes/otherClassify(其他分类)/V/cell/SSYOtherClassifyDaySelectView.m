//
//  SSYOtherClassifyDaySelectView.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyDaySelectView.h"

#import "SSYOtherClassifyDaySelectCell.h"

@interface SSYOtherClassifyDaySelectView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//collectionView;
@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation SSYOtherClassifyDaySelectView

#pragma mark 懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = self.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = RGB(244, 244, 244);
        //注册
        [_collectionView registerClass:[SSYOtherClassifyDaySelectCell class] forCellWithReuseIdentifier:@"SSYOtherClassifyDaySelectCellID"];
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
    [self addSubview:self.collectionView];
}


#pragma mark -------------------------<UICollectionViewDataSource>------------------------------------------------------
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cellView = nil;
    SSYOtherClassifyDaySelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSYOtherClassifyDaySelectCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cellView = cell;
    return cellView;
}


#pragma mark -------------------------<UICollectionViewDelegate>------------------------------------------------------
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 160);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 6;
}

#pragma mark - 定义每个section的四边距离，分别 上、左、下、右
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 15, 0, 10);
}


@end
