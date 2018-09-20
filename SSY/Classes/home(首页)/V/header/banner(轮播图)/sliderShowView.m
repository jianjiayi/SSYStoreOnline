//
//  sliderShowView.m
//  SSY
//
//  Created by 大为科技 on 2018/7/26.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "sliderShowView.h"
//导入第三方插件
#import "SDCycleScrollView.h"

@interface sliderShowView()<SDCycleScrollViewDelegate>

//轮播图
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end


@implementation sliderShowView

#pragma mark - Intial
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - bannerUI

-(void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, self.frame.size.height) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 5.0;
    [self addSubview:_cycleScrollView];
}

#pragma mark - 设置图片数组
-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"icon_img_null"];
    if(imageArray.count ==0) return;
    
    _cycleScrollView.imageURLStringsGroup = _imageArray;
}

#pragma mark - banner点击事件
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"您点击了banner的%zd张图片",index);
}


#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
