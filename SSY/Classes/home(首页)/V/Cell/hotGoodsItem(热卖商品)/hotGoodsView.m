//
//  hotGoodsView.m
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "hotGoodsView.h"

#import "hotGoodsItemCell.h"

#import "Masonry.h"


@interface hotGoodsView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/*定义一个collection*/
@property(nonatomic,strong) UICollectionView *collectionView;

@end


@implementation hotGoodsView

#pragma mark -懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.minimumLineSpacing = 1;//x轴方向间距
        layout.itemSize = CGSizeMake(self.frame.size.height*1.2, self.frame.size.height*0.95);//cell大小
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向水平
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = self.bounds;
        _collectionView.showsVerticalScrollIndicator = NO;//是否显示滚动条
        [self addSubview:_collectionView];
        
        
        //注册cell
        [_collectionView registerClass:[hotGoodsItemCell class] forCellWithReuseIdentifier:@"hotGoddsItemCellID"];
        
        
    }
    return _collectionView;
}


#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
}

#pragma mark - <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    hotGoodsItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotGoddsItemCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:242/255.0 blue:247/255.0 alpha:1/1.0];

    cell.titleLabel.text = @"大米";
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i=0; i<2; i++) {
        UIView *proView = [[UIView alloc] init];
        proView.tag = indexPath.row+i;
        
        //添加点击事件
        UITapGestureRecognizer *tabGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [proView addGestureRecognizer:tabGesturRecognizer];
        
        [cell.boxView addSubview:proView];
        
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [proView addSubview:imageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        nameLabel.textColor = [UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [proView addSubview:nameLabel];
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
        priceLabel.textColor = [UIColor colorWithRed:255/255.0 green:123/255.0 blue:59/255.0 alpha:1/1.0];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        [proView addSubview:priceLabel];
        
        //赋值
        imageView.image = [UIImage imageNamed:@"00001"];
        nameLabel.text = @"盘锦大米";
        priceLabel.text = @"11.00";
        
        [array addObject:proView]; //保存添加的控件
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(proView.mas_top)setOffset:0];
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.centerX.mas_equalTo(proView);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(imageView.mas_bottom)setOffset:5];
            make.width.mas_equalTo(proView).multipliedBy(0.8);
            make.centerX.mas_equalTo(proView);
        }];
        
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(nameLabel.mas_bottom)setOffset:5];
            make.centerX.mas_equalTo(proView);
            
        }];
        
    }
    //水平方向宽度固定等间隔
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:100 leadSpacing:8 tailSpacing:8];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(cell.boxView.mas_top)setOffset:0];
        make.height.mas_equalTo(cell.boxView.mas_height);
    }];
    return cell;
}

#pragma mark -设置cell间距
//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//设置section分区缩进量
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 0);
}


- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section
{
    return [UIColor redColor];
}

#pragma mark -点击事件
-(void)tapAction:(id)tap{
    NSLog(@"点击了热卖商品");
}



@end
