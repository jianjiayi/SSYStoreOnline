//
//  resetPawdViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "resetPawdViewController.h"
//重置密码
#import "resetPawdView.h"

@interface resetPawdViewController ()

@end

@implementation resetPawdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpSubView];
}


//创建UI
-(void)setUpSubView{
    self.title = @"重置密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    resetPawdView *subView = [[resetPawdView alloc] init];
    subView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
    subView.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:subView];
    
    //提交
    subView.ResetClickBlock = ^{
        NSLog(@"重置密码...");
    };
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
