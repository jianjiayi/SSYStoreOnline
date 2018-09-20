//
//  LRBgImgView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/8.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "LRBgImgView.h"

@implementation LRBgImgView

#pragma mark -Intail
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark -UI
-(void)setUpUI{
    _bgImageView = [[UIImageView alloc] init];
    _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    _bgImageView.clipsToBounds = YES;
    _bgImageView.image = [UIImage imageNamed:@"login_bg_img"];
    [self addSubview:_bgImageView];
}

#pragma mark - 布局
-(void) layoutSubviews
{
    [super layoutSubviews];
    
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(105+StatusBarHeight, (105+StatusBarHeight)*1.83));
    }];
}

@end
