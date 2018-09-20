//
//  registerViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/22.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "registerViewController.h"

//背景图片
#import "LRBgImgView.h"
//注册信息
#import "registerGroupView.h"

@interface registerViewController ()

@end

@implementation registerViewController

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
    
    [self setUpBg];
    
    [self setUpUI];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

//设置背景图
-(void)setUpBg{
    
    LRBgImgView *bgView = [[LRBgImgView alloc] init];
    [self.view insertSubview:bgView atIndex:0];
}
//创建页面
-(void)setUpUI{
    registerGroupView *registerView = [[registerGroupView alloc] init];
    registerView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
    [self.view addSubview:registerView];
    /**-----------------------代理方法--------------------------*/
    //获取验证码
    registerView.GetCodeClickBlock = ^(NSString *phone) { //phone 输入的手机号
        NSLog(@"已经往%@手机上发送了短信",phone);
    };
    //注册
    registerView.RegisterClickBlock = ^{
        NSLog(@"正在注册....");
    };
    //登录
    registerView.LoginClickBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
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
