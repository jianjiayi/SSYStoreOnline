//
//  SSYOtherCliassifyDaySelectHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyDaySelectHeadView.h"

@implementation SSYOtherClassifyDaySelectHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _titleImageView = [[UIImageView alloc] init];
    _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleImageView.clipsToBounds = YES;
    _titleImageView.image = [UIImage imageNamed:@"OCdaySelect_title"];
    [self addSubview:_titleImageView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(CGSizeMake(115, 20));
    }];
}


@end
