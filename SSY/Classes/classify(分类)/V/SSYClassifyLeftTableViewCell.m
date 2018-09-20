//
//  SSYClassifyLeftTableViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYClassifyLeftTableViewCell.h"

@implementation SSYClassifyLeftTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _leftLineView = [[UIView alloc] init];
    _leftLineView.backgroundColor = RGB(244, 244, 244);
    _leftLineView.hidden = YES;
    [self addSubview:_leftLineView];
    
    _classifyNameLabel = [[UILabel alloc] init];
    _classifyNameLabel.font = PFR13Font;
    _classifyNameLabel.textColor = RGB(102, 102, 102);
    _classifyNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_classifyNameLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(2);
    }];
    
    [_classifyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}


//是否被选中
-(void)setHasBeenSelected:(BOOL)hasBeenSelected
{
    _hasBeenSelected = hasBeenSelected;
    if(hasBeenSelected){
        self.backgroundColor = [UIColor whiteColor];
        self.leftLineView.backgroundColor = MColor;
        self.leftLineView.hidden = NO;
    }else{
        self.backgroundColor = RGB(244, 244, 244);
        self.leftLineView.backgroundColor = RGB(244, 244, 244);
        self.leftLineView.hidden = YES;
    }
    
}

//设置数据模型
-(void)setCurLeftTagModel:(SSYClassifyLeftModel *)curLeftTagModel
{
    _curLeftTagModel = curLeftTagModel;
    self.classifyNameLabel.text = curLeftTagModel.tagName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
