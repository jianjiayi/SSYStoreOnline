//
//  tabBarViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/20.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "tabBarViewController.h"

#import "homeViewController.h"
#import "shopStreetViewController.h"
#import "shopCartViewController.h"
#import "mineViewController.h"


@interface tabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic,assign) NSInteger  indexFlag;//记录上一次点击tabbar，使用时，记得先在init或viewDidLoad里 初始化 = 0

@end

@implementation tabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //取消tabbar的透明效果
    [UITabBar appearance].translucent = NO;
    //设置tabbar文字大小、位置、颜色
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 0)];//位置
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9],NSForegroundColorAttributeName:[UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1]} forState:UIControlStateSelected];

    [self loadViewControllers];
}

-(void)loadViewControllers{
    homeViewController *oneVC = [[homeViewController alloc]init];
    NavBarViewController *nav1 = [[NavBarViewController alloc] initWithRootViewController:oneVC];
    oneVC.tabBarItem.title = @"首页";
    oneVC.tabBarItem.image = [[UIImage imageNamed:@"tabBarIcon01@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarIcon001@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    shopStreetViewController *twoVC = [[shopStreetViewController alloc]init];
    NavBarViewController *nav2 = [[NavBarViewController alloc] initWithRootViewController:twoVC];
    twoVC.tabBarItem.title = @"店铺街";
    twoVC.tabBarItem.image = [[UIImage imageNamed:@"tabBarIcon02@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarIcon002@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    shopCartViewController *threeVC = [[shopCartViewController alloc]init];
    NavBarViewController *nav3 = [[NavBarViewController alloc] initWithRootViewController:threeVC];
    threeVC.tabBarItem.title = @"购物篮";
    threeVC.tabBarItem.image = [[UIImage imageNamed:@"tabBarIcon03@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarIcon003@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    mineViewController *fourVC = [[mineViewController alloc]init];
    NavBarViewController *nav4 = [[NavBarViewController alloc] initWithRootViewController:fourVC];
    fourVC.tabBarItem.title = @"我的";
    fourVC.tabBarItem.image = [[UIImage imageNamed:@"tabBarIcon04@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarIcon004@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
}


#pragma mark - <UITabBarDelegate>

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        //放大效果，并回到原位
        //需要实现的帧动画,这里根据自己需求改动
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.values = @[@1.0,@1.1,@0.9,@1.0];
        animation.duration = 0.3;
        animation.calculationMode = kCAAnimationCubic;
        [[arry[index] layer] addAnimation:animation forKey:nil];
        
        
//        //放大效果
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        //速度控制函数，控制动画运行的节奏
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        animation.duration = 0.2;       //执行时间
//        animation.repeatCount = 1;      //执行次数
//        animation.removedOnCompletion = NO;
//        animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
//        animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
//        animation.toValue = [NSNumber numberWithFloat:1.15];     //结束伸缩倍数
//        [[arry[index] layer] addAnimation:animation forKey:nil];
//        //移除其他tabbar的动画
//        for (int i = 0; i<arry.count; i++) {
//            if (i != index) {
//                [[arry[i] layer] removeAllAnimations];
//            }
//        }
        
        
        self.indexFlag = index;
    }
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
