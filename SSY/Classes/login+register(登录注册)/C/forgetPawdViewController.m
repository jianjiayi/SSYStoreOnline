//
//  forgetPawdViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/23.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "forgetPawdViewController.h"
//忘记密码
#import "forgetPawdView.h"
//重置密码
#import "resetPawdViewController.h"


#import "CustomIOSAlertView.h"

@interface forgetPawdViewController ()


@end

@implementation forgetPawdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubView];
}
//创建UI
-(void)setUpSubView{
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    forgetPawdView *subView = [[forgetPawdView alloc] init];
    subView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
    subView.backgroundColor = RGB(244, 244, 244);
    [self.view addSubview:subView];
    
    //发送短信验证码
    subView.GetCodeCLickBlock = ^(NSString *phone) {
        NSLog(@"正在向 %@ 手机上发送短信",phone);
        
        
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        //添加子视图
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 200)];
        view.text = @"我是子视图";
        view.textAlignment = NSTextAlignmentCenter;
        view.backgroundColor = [UIColor redColor];
        
        [alertView setContainerView:view];
        //显示
        NSLog(@"alert11111111");
        [alertView show];
        
    };
    
    //下一步
    subView.NextClickBlock = ^{
        NSLog(@"忘记密码下一步");
        
        resetPawdViewController *resetPawdVC = [[resetPawdViewController alloc] init];
        [self.navigationController pushViewController:resetPawdVC animated:YES];
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
