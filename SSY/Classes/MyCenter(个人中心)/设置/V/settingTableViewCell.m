//
//  settingTableViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/8/27.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "settingTableViewCell.h"

@implementation settingTableViewCell

#pragma mark - init
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
-(void)setUpUI
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = PFR13Font;
    _titleLabel.textColor = RGB(16, 0, 0);
    [self addSubview:_titleLabel];
    
    _arrowImageView = [[UIImageView alloc] init];
    _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    _arrowImageView.clipsToBounds = YES;
    _arrowImageView.image = [UIImage imageNamed:@"ArrowRight_icon"];
    [self addSubview:_arrowImageView];
}

#pragma mark - 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.mas_left)setOffset:15];
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self);
    }];
    
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self.mas_right)setOffset:-10];
        make.size.mas_equalTo(CGSizeMake(8, 10));
        make.centerY.mas_equalTo(self);
    }];
}

-(void)setTitleContent:(NSString *)titleContent{
    _titleContent = titleContent;
    self.titleLabel.text = titleContent;
}


@end
