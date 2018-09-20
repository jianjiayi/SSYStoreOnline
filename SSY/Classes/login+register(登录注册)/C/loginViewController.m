//
//  loginViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/7.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "loginViewController.h"

//背景图片
#import "LRBgImgView.h"
//登录信息
#import "loginGroupView.h"

#import "forgetPawdViewController.h"

#import "registerViewController.h"


@interface loginViewController ()

@end

@implementation loginViewController

//在当前页面加入下面方法
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

//如果仅设置当前页导航透明，需加入下面方法
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self setUpBg];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpUI];
}
//设置导航栏
-(void)setNavBar{
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(0, 0, 40, 40);
    [closeBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeLoginClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:closeBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//设置背景图
-(void)setUpBg{
    LRBgImgView *bgView = [[LRBgImgView alloc] init];
    [self.view insertSubview:bgView atIndex:0];
}

-(void)setUpUI{
    loginGroupView *loginView = [[loginGroupView alloc] init];
    loginView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
    [self.view addSubview:loginView];
    
    loginView.ForgetClickBlock = ^(NSString *phone) {
        NSLog(@"您点击了忘记密码");
        forgetPawdViewController *forgetPawdVC = [[forgetPawdViewController alloc] init];
        [self.navigationController pushViewController:forgetPawdVC animated:YES];
    };
    
    loginView.LoginClickBlock = ^{
        NSLog(@"您点击了登录");
    };
    
    loginView.RegisterClickBlock = ^{
        NSLog(@"您点击了注册");
        registerViewController *registerVC = [[registerViewController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    };
}

//关闭页面
-(void)closeLoginClick{
    NSLog(@"close login view");
    [self.view endEditing:YES];//关闭键盘
    [self dismissViewControllerAnimated:YES completion:nil];
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
