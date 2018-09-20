//
//  SSYOtherClassifyMenuListHeadView.m
//  SSY
//
//  Created by 大为科技 on 2018/9/19.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOtherClassifyMenuListHeadView.h"

@implementation SSYOtherClassifyMenuListHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
        [self setUpData];
    }
    return self;
}

-(void)setUpUI{
    _scrollMenu = [[SSYScrollMenu alloc] initWithFrame:self.bounds];
    _scrollMenu.delegate = self;
    _scrollMenu.backgroundColor = [UIColor whiteColor];
    [self addSubview:_scrollMenu];
    
    _menuArray = [[NSMutableArray alloc] init];
}

-(void)setUpData{
    self.menuArray = [NSMutableArray arrayWithArray:@[@"精选",@"苹果",@"梨",@"芒果",@"甘蔗田友",@"奇异果",@"石榴",@"香蕉",@"橘子"]];
    self.scrollMenu.menuArray = self.menuArray;
}

@end
