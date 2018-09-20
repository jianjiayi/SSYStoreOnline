//
//  SSYOtherCliassifyBannerHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyBannerHeadView.h"

@implementation SSYOtherClassifyBannerHeadView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI{
    _bannderView = [[UIView alloc] init];
    _bannderView.backgroundColor = RGB(244, 244, 244);
    [self addSubview:_bannderView];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.clipsToBounds = YES;
    [self.bannderView addSubview:_imageView];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_bannderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(ScreenW, 120));
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.bannderView);
    }];
}

-(void)setImgUrl:(NSString *)imgUrl
{
    _imgUrl = imgUrl;
    self.imageView.image = [UIImage imageNamed:imgUrl];
}

@end
