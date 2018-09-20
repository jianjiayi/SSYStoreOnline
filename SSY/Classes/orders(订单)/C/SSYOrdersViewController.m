//
//  SSYOrdersViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYOrdersViewController.h"

@interface SSYOrdersViewController ()

@end

@implementation SSYOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
}

-(void)setUpBase{
    self.title = @"我的订单";
    self.view.backgroundColor = RGB(244, 244, 244);
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
