//
//  SSYClassifyRightCollectionViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYClassifyRightCollectionViewCell.h"

@implementation SSYClassifyRightCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.clipsToBounds = YES;
    [self addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = PFR12Font;
    _titleLabel.textColor = RGB(16, 0, 0);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.mas_equalTo(5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self.imageView.mas_bottom)setOffset:10];
    }];
    
}


-(void)setCurNoHeadRightModel:(SSYCliassifyRightModel *)curNoHeadRightModel
{
    _curNoHeadRightModel = curNoHeadRightModel;
    self.imageView.image = [UIImage imageNamed:curNoHeadRightModel.roomImgUrl];
    self.titleLabel.text = curNoHeadRightModel.roomName;
}


@end
