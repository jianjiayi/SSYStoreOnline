//
//  FeedbackViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/28.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "FeedbackViewController.h"

#import "FeedbackView.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self setUpUI];
}

#pragma mark -init
-(void)setUpBase{
    self.title = @"意见反馈";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -UI
-(void)setUpUI{
    FeedbackView *subview = [[FeedbackView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight)];
    subview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subview];
    
    subview.submitClickBlock = ^(NSString *text) {
        NSLog(@"提交反馈信息");
    };
}

//关闭键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
