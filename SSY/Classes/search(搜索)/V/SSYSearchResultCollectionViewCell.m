//
//  SSYSearchResultCollectionViewCell.m
//  SSY
//
//  Created by 大为科技 on 2018/9/11.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYSearchResultCollectionViewCell.h"

@implementation SSYSearchResultCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    _imgView = [[UIImageView alloc] init];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.clipsToBounds = YES;
    _imgView.backgroundColor = RGB(200, 200, 200);
    MASAttachKeys(self.imgView);
    [self addSubview:_imgView];
    
    _titileLabel = [[UILabel alloc] init];
    _titileLabel.font = PFR14Font;
    _titileLabel.textColor = RGB(16, 0, 0);
    _titileLabel.numberOfLines = 2;
    MASAttachKeys(self.titileLabel);
    [self addSubview:_titileLabel];
    
    _postageLabel = [[UILabel alloc] init];
    _postageLabel.font = PFR10Font;
    _postageLabel.textColor = MColor;
    _postageLabel.layer.borderColor = MColor.CGColor;
    _postageLabel.layer.borderWidth = 1.0;
    _postageLabel.layer.cornerRadius = 8.0;
    _postageLabel.textAlignment = UITextAlignmentCenter;
    MASAttachKeys(self.postageLabel);
    [self addSubview:_postageLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = PFR16Font;
    _priceLabel.textColor = RGB( 255, 83, 0);
    MASAttachKeys(self.priceLabel);
    [self addSubview:_priceLabel];
    
    _shopNameLabel = [[UILabel alloc] init];
    _shopNameLabel.font = PFR10Font;
    _shopNameLabel.textColor = RGB(155, 155, 155);
    MASAttachKeys(self.shopNameLabel);
    [self addSubview:_shopNameLabel];
    
    _shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shopBtn setTitle:@"进店" forState:UIControlStateNormal];
    _shopBtn.titleLabel.font = PFR10Font;
    [_shopBtn setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
    [_shopBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    [_shopBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_shopBtn.imageView.intrinsicContentSize.width, 0, _shopBtn.imageView.intrinsicContentSize.width)];
    [_shopBtn setImageEdgeInsets:UIEdgeInsetsMake(5, _shopBtn.titleLabel.intrinsicContentSize.width+4, 5, 2)];
    [_shopBtn addTarget:self action:@selector(goShopClick:) forControlEvents:UIControlEventTouchUpInside];
    MASAttachKeys(self.shopBtn);
    [self addSubview:_shopBtn];
    
    _addCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addCartBtn setImage:[UIImage imageNamed:@"addCart_icon"] forState:UIControlStateNormal];
    [_addCartBtn setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    [_addCartBtn addTarget:self action:@selector(addCartClick:) forControlEvents:UIControlEventTouchUpInside];
    MASAttachKeys(self.addCartBtn);
    [self addSubview:_addCartBtn];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = RGB(200, 200, 200);
    [self addSubview:_lineView];
    
}

-(void)setIsGrid:(BOOL *)isGrid
{
    [self updateConstraintsIfNeeded];
    _isGrid = isGrid;
    if(isGrid){
        [_imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(self.mas_top)setOffset:0];
            [make.left.mas_equalTo(self.mas_left)setOffset:0];
            make.width.mas_equalTo(self.mas_width);
            make.height.mas_equalTo(self.mas_width);
        }];
        
        [_titileLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(self.imgView.mas_bottom)setOffset:5] ;
            [make.left.mas_equalTo(self.mas_left)setOffset:15];
            [make.right.mas_equalTo(self.mas_right)setOffset:-10];;
        }];
        
        [_postageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self)setOffset:15];
            [make.top.mas_equalTo(self.titileLabel.mas_bottom)setOffset:5];
            make.size.mas_equalTo(CGSizeMake(30, 16));
        }];
        
        [_shopNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self)setOffset:15];
            [make.bottom.mas_equalTo(self.mas_bottom)setOffset:-10];
        }];
        
        [_priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self)setOffset:15];
            [make.bottom.mas_equalTo(self.shopNameLabel.mas_top)setOffset:0];
        }];
        
        [_shopBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.shopNameLabel.mas_right)setOffset:15];
            make.centerY.mas_equalTo(self.shopNameLabel);
        }];
        
        [_addCartBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.right.mas_equalTo(self.mas_right)setOffset:-10];
            make.centerY.mas_equalTo(self.priceLabel);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }else{
        
        [_imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        [_titileLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.top.mas_equalTo(self.imgView.mas_top)setOffset:0];
            [make.left.mas_equalTo(self.imgView.mas_right)setOffset:10];
            [make.right.mas_equalTo(self.mas_right)setOffset:-10];;
        }];
        
        [_postageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.imgView.mas_right)setOffset:10];
            [make.top.mas_equalTo(self.titileLabel.mas_bottom)setOffset:8];
            make.size.mas_equalTo(CGSizeMake(30, 16));
        }];
        
        [_shopNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.imgView.mas_right)setOffset:10];
            [make.bottom.mas_equalTo(self.imgView.mas_bottom)setOffset:0];
        }];
        
        [_priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.imgView.mas_right)setOffset:10];
            [make.bottom.mas_equalTo(self.shopNameLabel.mas_top)setOffset:0];
        }];
        
        [_shopBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.shopNameLabel.mas_right)setOffset:15];
            make.centerY.mas_equalTo(self.shopNameLabel);
        }];
        
        [_addCartBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.right.mas_equalTo(self.mas_right)setOffset:-10];
            make.centerY.mas_equalTo(self.shopNameLabel);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            [make.left.mas_equalTo(self.imgView.mas_right)setOffset:10];
            [make.right.mas_equalTo(self.mas_right)setOffset:0];
            make.height.mas_equalTo(1);
            [make.bottom.mas_equalTo(self.mas_bottom)setOffset:0];
        }];
    }
    
}

//查看详情


//进店
-(void)goShopClick:(UIButton *)sender{
    if(self.shopBtn){
        self.GoShopClickBlock(@"1111");
    }
}

//加入购物车
-(void)addCartClick:(UIButton *)sender{
    if(self.addCartBtn){
        self.AddCartClickBlock(@"222");
    }
}


@end
