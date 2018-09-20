//
//  areaViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/8/13.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "areaViewController.h"
#import "districtView.h"

@interface areaViewController ()

@end

@implementation areaViewController

- (void)viewWillLayoutSubviews {
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.view.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    districtView *bgView = [[districtView alloc] init];
    [self.view addSubview:bgView];
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
