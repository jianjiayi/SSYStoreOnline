//
//  mineBaseItemView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/7.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "mineBaseItemView.h"
#import "mineBaseItemCell.h"

@interface mineBaseItemView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,strong) NSMutableArray *baseIconArray;

@end


@implementation mineBaseItemView

#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = self.bounds;
        
        //注册cell
        [_collectionView registerClass:[mineBaseItemCell class] forCellWithReuseIdentifier:@"mineBaseItemCellID"];
    }
    return _collectionView;
}
-(NSMutableArray *)baseIconArray{
    if(!_baseIconArray){
        _baseIconArray = [[NSMutableArray alloc] init];
    }
    return _baseIconArray;
}


#pragma mark -初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
        [self createData];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collectionView];
}

-(void)createData{
    NSArray *data = @[@{@"url":@"MYgzdp_icon",@"name":@"关注店铺",@"id":@"1"},
                       @{@"url":@"MYscsp_icon",@"name":@"收藏商品",@"id":@"2"},
                       @{@"url":@"MYzj_icon",@"name":@"足迹",@"id":@"3"},
                       @{@"url":@"MYwykd_icon",@"name":@"我要开店",@"id":@"4"},
                       @{@"url":@"MYgywm_icon",@"name":@"关于我们",@"id":@"5"}];
    for (int i = 0; i < data.count; i++) {
        SSYMineBaseItemModel *item = [[SSYMineBaseItemModel alloc] init];
        item.iconUrl = data[i][@"url"];
        item.iconName = data[i][@"name"];
        [self.baseIconArray addObject:item];
    }
}


#pragma mark -布局 <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.baseIconArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    mineBaseItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineBaseItemCellID" forIndexPath:indexPath];
    SSYMineBaseItemModel *model = self.baseIconArray[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.baseItemModel = model;
    
    return cell;
}

//cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW/4,85);
}

#pragma mark - <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"您点击了我的第%zd个item",indexPath.row);
}




@end
