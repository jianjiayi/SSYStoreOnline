//
//  shopStreetViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopStreetViewController.h"

//导航栏
#import "shopStreetTopToolView.h"
//cell
#import "shopProViewCell.h"

#import "areaViewController.h"


@interface shopStreetViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/*导航栏工具*/
@property (nonatomic,strong) shopStreetTopToolView *topToolView;
//collectionView
@property(nonatomic,strong) UICollectionView *collectionView;

@end

@implementation shopStreetViewController

#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.frame = CGRectMake(0, TopHeight, ScreenW, ScreenH-TopHeight-TabBarHeight);
        
        //注册cell
        [_collectionView registerClass:[shopProViewCell class] forCellWithReuseIdentifier:@"shopProViewCellID"];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setUpNavBar];
    //创建collection
    [self setUpBaseUI];
    
}

-(void)setUpNavBar{
    //隐藏navbar
    self.navigationController.navigationBar.hidden = YES;
    //创建新的navbar
    _topToolView = [[shopStreetTopToolView alloc] initWithFrame:CGRectMake(0, 0, ScreenW , TopHeight)];
    _topToolView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topToolView];
    WEAKSELF
    //选择地区
    _topToolView.areaItemClickBlock = ^{
        NSLog(@"您点击了选择地区");
        
        [weakSelf loadDistrictView];
        
    };
    //消息按钮
    _topToolView.rightItemClickBlock = ^{
        NSLog(@"您点击了消息按钮");
    };
}
//加载地区
-(void)loadDistrictView{
    areaViewController *districtVC = [[areaViewController alloc] init];
    self.definesPresentationContext = YES;
    districtVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    districtVC.edgesForExtendedLayout = UIRectEdgeNone;
    /*添加手势事件,移除View*/
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView:)];
    [districtVC.view addGestureRecognizer:tapGesture];
    
    [self.tabBarController presentViewController:districtVC animated:YES completion:nil];
}

#pragma mark - 手势点击事件,移除View
- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)setUpBaseUI{
    self.collectionView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    [self.view addSubview:self.collectionView];
}

#pragma mark -<UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
//商店商品
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    shopProViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopProViewCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 10;
    cell.clipsToBounds = YES;
    return cell;
}

//设置cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenW-20, (ScreenW-20)*2/3+100);
}

//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 0, 0, 0);//分别为上、左、下、右
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
