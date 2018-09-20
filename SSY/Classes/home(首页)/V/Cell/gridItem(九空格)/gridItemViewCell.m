//
//  gridItemViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/7/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "gridItemViewCell.h"

#import "Masonry.h"

#define cellW [UIScreen mainScreen].bounds.size.width/4

@implementation gridItemViewCell

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark -UI
-(void)setUpUI{
    //图片
    _gridImageView = [[UIImageView alloc] init];
    _gridImageView.contentMode = UIViewContentModeScaleAspectFill;
    _gridImageView.clipsToBounds = YES;
    [self addSubview:_gridImageView];
    //文字
    _gridLabel = [[UILabel alloc] init];
    _gridLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
    _gridLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_gridLabel];
    //tag
    _tagLabel = [[UILabel alloc]init];
    _tagLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:8];
    _tagLabel.backgroundColor = [UIColor whiteColor];
    _tagLabel.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:_tagLabel];
}

#pragma makr -布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    //图片
    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(cellW-50 , cellW-50));
        make.centerX.mas_equalTo(self);
    }];
    //文字
    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self.gridImageView.mas_bottom)setOffset:10];
    }];
    //tag提示
    [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.gridImageView.mas_centerX);
        make.top.mas_equalTo(self.gridImageView);
        make.size.mas_equalTo(CGSizeMake(35, 15));
    }];
}


-(void)setGridItemModel:(SSYGridItemModel *)GridItemModel
{
    _GridItemModel = GridItemModel;
    self.gridImageView.image = [UIImage imageNamed:GridItemModel.iconUrl];
    self.gridLabel.text = GridItemModel.iconName;
}


@end
