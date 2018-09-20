//
//  GuideViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/20.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "GuideViewController.h"
#import "tabBarViewController.h"
#import "pageControl.h"

#define WIDTH (NSInteger)self.view.bounds.size.width
#define HEIGHT (NSInteger)self.view.bounds.size.height

@interface GuideViewController ()<UIScrollViewDelegate>
//创建页码控制器
@property(nonatomic,strong) pageControl *pageControl;
//判断是否第一次进入
@property(nonatomic,assign) BOOL flag;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide0%d@2x.png",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT)];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        //在最后一页创建按钮
        if(i == 3){
           //必须设置用户操作 否则按键无法操作
            imageView.userInteractionEnabled = YES;
            
            UIView *borderView = [[UIView alloc] init];
            borderView.frame = CGRectMake(WIDTH/3, HEIGHT*5/6, WIDTH/3, HEIGHT/16);
            borderView.layer.borderWidth = 1;
            borderView.layer.cornerRadius = HEIGHT/32;
            borderView.layer.borderColor = [[UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0]CGColor];
            
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            [button setTitle:@"点击进入" forState:UIControlStateNormal];
            button.layer.cornerRadius = (borderView.bounds.size.height-4 )/2;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.backgroundColor =[UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0];
            [borderView addSubview:button];
            [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(borderView);
                make.size.mas_equalTo(CGSizeMake(borderView.bounds.size.width-4, borderView.bounds.size.height-4));
            }];
            
            [imageView addSubview:borderView];
        }
        
        imageView.image = image;
        
        [guideScrollView addSubview:imageView];
    }
    
    guideScrollView.bounces = NO;
    guideScrollView.pagingEnabled = YES;
    guideScrollView.showsHorizontalScrollIndicator = NO;
    guideScrollView.contentSize = CGSizeMake(WIDTH*4, HEIGHT);
    guideScrollView.delegate = self;
    [self.view addSubview:guideScrollView];
    
    _pageControl = [[pageControl alloc] initWithFrame:CGRectMake(WIDTH/3, HEIGHT*15/16, WIDTH/3, HEIGHT/16)];
    //设置页数
    _pageControl.numberOfPages = 4;
    //设置页码的点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1/1.0];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0];
    
    [self.view addSubview:_pageControl];
}

#pragma mark -UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算当前在第一页
    _pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x/WIDTH);
}

//点击按钮保存数据并且换跟视图控制器
-(void) go:(UIButton *)sender{
    _flag = YES;
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    
    //保存用户数据
    [useDef setBool:_flag forKey:@"notFirst"];
    [useDef synchronize];
    
    //切换跟视图控制器
    self.view.window.rootViewController = [[tabBarViewController alloc]init];
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
