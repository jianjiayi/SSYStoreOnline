//
//  shopStreetTopToolView.m
//  SSY
//
//  Created by 大为科技 on 2018/8/9.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopStreetTopToolView.h"

@implementation shopStreetTopToolView

#pragma mark - Intail
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI{
    
    _flag = YES;
    //消息按钮
    _rightItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightItemBtn.contentMode = UIViewContentModeScaleAspectFill;
    [_rightItemBtn setImage:[UIImage imageNamed:@"icon_message@2x"]forState:UIControlStateNormal];
    [_rightItemBtn addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_rightItemBtn];
    //地区按钮
    _areaItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_areaItemBtn setTitle:@"河北省" forState:UIControlStateNormal];
    _areaItemBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    [_areaItemBtn setTitleColor:[UIColor colorWithRed:16/255.0 green:0/255.0 blue:0/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    [_areaItemBtn setImage:[UIImage imageNamed:@"triangle-down"] forState:UIControlStateNormal];
    
//    _areaItemBtn.backgroundColor = [UIColor redColor];
    [_areaItemBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_areaItemBtn.imageView.intrinsicContentSize.width, 0, _areaItemBtn.imageView.intrinsicContentSize.width)];
    [_areaItemBtn setImageEdgeInsets:UIEdgeInsetsMake(8,_areaItemBtn.titleLabel.intrinsicContentSize.width+6, 8,0)];
    [_areaItemBtn addTarget:self action:@selector(switchAreaClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_areaItemBtn];
    
}

#pragma mark - 布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_rightItemBtn mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(44, 44));
        [make.right.mas_equalTo(self.mas_right)setOffset:0];
        [make.top.mas_equalTo(self.mas_top)setOffset:StatusBarHeight];
    }];
    
    [_areaItemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self.rightItemBtn);
    }];
}
#pragma mark -点击事件

//右边按钮点击
-(void)rightButtonClick{
    !_rightItemClickBlock ? : _rightItemClickBlock();
}
//地区选择
-(void)switchAreaClick{
    bool  flag = self.flag;
    UIView *imageView = self.areaItemBtn.imageView;
    if(flag){
        NSLog(@"开启");
        [UIView animateWithDuration:0.5 animations:^{
            imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }completion:^(BOOL finished) {
            self.flag = NO;
        }];
    }else{
        NSLog(@"关闭");
        [UIView animateWithDuration:0.5 animations:^{
            imageView.transform = CGAffineTransformMakeRotation(0);
        }completion:^(BOOL finished) {
            self.flag = YES;
        }];
    }
    !_areaItemClickBlock ? : _areaItemClickBlock();
}


@end
