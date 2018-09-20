//
//  NavBarViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/22.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "NavBarViewController.h"

@interface NavBarViewController ()

@end

@implementation NavBarViewController

#pragma mark -load
+(void)load{
    [self setUpBase];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(void)setUpBase{
    //设置背景色
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor whiteColor];
    [bar setTintColor:[UIColor darkGrayColor]];
    //设置titile字体
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    UIColor *naiColor = RGB(16, 0, 0);
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = PFR18Font;
    bar.titleTextAttributes = attributes;
}

#pragma mark -返回按钮
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 30, 44);
        [button setImage:[UIImage imageNamed:@"navBar_back_icon"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 16)];
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationController.view.backgroundColor = [UIColor whiteColor];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //添加右滑返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
