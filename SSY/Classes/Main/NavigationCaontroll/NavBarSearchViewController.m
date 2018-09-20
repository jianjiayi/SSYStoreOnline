//
//  NavBarSearchViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/12.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "NavBarSearchViewController.h"

@interface NavBarSearchViewController ()

@end

@implementation NavBarSearchViewController

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
        
        //搜索框view
        UIView *topSearchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 32)];
        topSearchView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
        topSearchView.layer.cornerRadius = 16;
        [topSearchView.layer masksToBounds];
        //搜索按钮
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        searchButton.frame = CGRectMake(0, 0, ScreenW, 32);
        [searchButton setTitle:@"输入商品和商家" forState:0];
        [searchButton setTitleColor:[UIColor lightGrayColor] forState:0];
        searchButton.titleLabel.font = PFR13Font;
        [searchButton setImage:[UIImage imageNamed:@"icon_search@2x"] forState:0];
        [searchButton adjustsImageWhenHighlighted];
        
        searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [topSearchView addSubview:searchButton];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.navigationItem.titleView = topSearchView;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
