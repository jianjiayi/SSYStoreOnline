//
//  FeedbackView.h
//  SSY
//
//  Created by 大为科技 on 2018/8/30.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackView : UIView <UITextViewDelegate>

//提示
@property(nonatomic,strong) UILabel *tipsLabel;

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,strong) UITextView *textView;

@property(nonatomic,strong) UILabel *placeHolderLabel;

@property(nonatomic,strong) UILabel *numLabel;

@property(nonatomic,strong) UIView *tabBarView;

@property(nonatomic,strong) UIButton *submitBtn;

@property(nonatomic,copy) void (^ submitClickBlock)(NSString *text);

@end
