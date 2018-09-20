//
//  SSYScrollMenu.m
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYScrollMenu.h"

@interface SSYScrollMenu()

//scroll
@property(nonatomic,strong) UIScrollView *scrollView;
//底边线
@property(nonatomic,strong) UIView *breakline;


@end


@implementation SSYScrollMenu

#pragma mark - 初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self){
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView = scrollView;
        [self addSubview:scrollView];
        
        UIView *breakline = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5f, frame.size.width, 0.5f)];
        breakline.backgroundColor = MColor;
        self.breakline = breakline;
        breakline.hidden= YES;
        [self addSubview:breakline];
    }
    return self;
}

#pragma mark -设置数据源
-(void)setMenuArray:(NSMutableArray *)menuArray
{
    _menuArray = menuArray;
    [self setUpMenuBtns];
}

#pragma mark -加载按钮
-(void)setUpMenuBtns{
    //移除所有按钮
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    UIFont *btnFont = [UIFont systemFontOfSize:16];
    
    //遍历
    for (int i = 0; i < self.menuArray.count; i++) {
        UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.tag = i;
        [menuBtn setTitle:self.menuArray[i] forState:UIControlStateNormal];
        [menuBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
        menuBtn.titleLabel.font = btnFont;
        
        [menuBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat menuBtnX = 15.f;
        if(self.scrollView.subviews.count>0){
            //非第一个
            menuBtnX = CGRectGetMaxX([self.scrollView.subviews lastObject].frame)+25;
        }
        
        //计算按钮大小
        CGRect btnRect = [self.menuArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:btnFont} context:nil];
        
        menuBtn.frame = CGRectMake(menuBtnX, 0, btnRect.size.width, self.scrollView.frame.size.height);
        
        [self.scrollView addSubview:menuBtn];
        
        if(i == 0){
            //默认选中第一个
            self.selectedBtn = menuBtn;
        }
        
    }
    
    if(self.scrollView.subviews.count > 0){
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX([self.scrollView.subviews lastObject].frame)+25.f, 0);
    }
    
}

#pragma mark -设置选中按钮
-(void)setSelectedBtn:(UIButton *)selectedBtn{
    //防止重复点击
    if(selectedBtn == _selectedBtn) return;
    
    //计算scrollView偏移量
    CGFloat originX = selectedBtn.center.x - CGRectGetMidX(self.scrollView.frame);//按钮中心距离scrollView最左边的距离
    CGFloat maxOffsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;//scrollView内容的宽度减去scrollView的宽度,获得最大的偏移量
    
    if(originX < 0){
        originX = 0;
    }else if(originX > maxOffsetX){
        originX = maxOffsetX;
    }
    //scrollView滚动到指定位置
    [self.scrollView setContentOffset:CGPointMake(originX, 0) animated:YES];
    
    //改变按钮颜色
    [self.selectedBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    [selectedBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    
    //缩放动画
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = [NSNumber numberWithFloat:1.1f];
    animation1.toValue  = [NSNumber numberWithFloat:1.0f];
    animation1.duration = 0.3;
    animation1.repeatCount = 1;
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    animation1.autoreverses = NO;
    [self.selectedBtn.titleLabel.layer addAnimation:animation1 forKey:@"animation1"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:1.0f];
    animation2.toValue  = [NSNumber numberWithFloat:1.1f];
    animation2.duration = 0.3;
    animation2.repeatCount = 1;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.autoreverses = NO;
    [selectedBtn.titleLabel.layer addAnimation:animation2 forKey:@"animation2"];
    
    
    _selectedBtn = selectedBtn;
    
}

#pragma mark -点击
-(void)menuBtnClick:(UIButton *)sender{
    if(self.selectedBtn == sender) return;
    
    self.selectedBtn = sender;
    
    if([self.delegate respondsToSelector:@selector(menuBtnClickAtIndex:)]){
        [self.delegate menuBtnClickAtIndex:sender.tag];
    }
}

#pragma mark -设置底线
-(void)setIsShowBreakline:(BOOL *)isShowBreakline
{
    _isShowBreakline = isShowBreakline;
    self.breakline.hidden = !isShowBreakline;
}

#pragma mark -设置底线颜色
-(void)setBreaklineColor:(UIColor *)color
{
    self.breakline.backgroundColor = color;
}

-(void)setSelectedIndex:(NSInteger)index{
    if([self.scrollView subviews].count > index){
        UIButton *selectedBtn = (UIButton *)[self.scrollView subviews][index];
        self.selectedBtn = selectedBtn;
    }
}






@end
