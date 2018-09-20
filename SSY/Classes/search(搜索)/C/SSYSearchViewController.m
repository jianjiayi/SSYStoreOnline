//
//  SSYSearchViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/9/7.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "SSYSearchViewController.h"

#import "SSYSearchResultViewController.h"

#import "UIView+BBLayout.h"

@interface SSYSearchViewController ()<UITextFieldDelegate>
//搜索框
@property(nonatomic,strong) UIView *searchView;
//输入框
@property(nonatomic,strong) UITextField *searchTextField;
//取消按钮
@property(nonatomic,strong) UIButton *cancelSearchBtn;

//热门搜索view
@property(nonatomic,strong) UIView *remenView;

@property (nonatomic, strong) NSArray *originArr;
@property (nonatomic, strong) NSMutableArray *searchTextArr;

//历史搜索view
@property(nonatomic,strong) UIView *historyView;
//搜索历史tips
@property(nonatomic,strong) UILabel *searchHistoryLab;
//清空历史记录按钮
@property(nonatomic,strong) UIButton *clearBtn;

@end

@implementation SSYSearchViewController

#pragma mark - 懒加载
//取消按钮
-(UIButton *)cancelSearchBtn
{
    if(!_cancelSearchBtn){
        _cancelSearchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelSearchBtn.frame = CGRectMake(0, 0, 30, 44);
        _cancelSearchBtn.titleLabel.font = PFR16Font;
        [_cancelSearchBtn setTitleColor:RGB(105, 105, 105) forState:UIControlStateNormal];
        [_cancelSearchBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelSearchBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelSearchBtn;
}

-(UIView *)searchView{
    if(!_searchView){
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.frame = CGRectMake(10, 3, 26, 26);
        searchIcon.image = [UIImage imageNamed:@"icon_search@2x"];
        
        UITextField *textField = [[UITextField alloc] init];
        textField.frame = CGRectMake(45, 0, ScreenW -120, 32);
        textField.placeholder = @"请输入商品和商家关键词";
        textField.font = PFR13Font;
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeySearch;
        self.searchTextField = textField;
        
        _searchView = [[UIView alloc] init];
        _searchView.frame = CGRectMake(0, 0, ScreenW-44-15, 32);
        _searchView.backgroundColor = RGB(244, 244, 244);
        _searchView.layer.cornerRadius = 16;
        [_searchView.layer masksToBounds];
        
        [_searchView addSubview:searchIcon];
        [_searchView addSubview:self.searchTextField];
        
    }
    return _searchView;
}

- (UILabel *)searchHistoryLab {
    
    if (_searchHistoryLab == nil) {
        _searchHistoryLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 17, 80, 20)];
        _searchHistoryLab.text = @"最近搜索";
        _searchHistoryLab.textColor = [UIColor grayColor];
        _searchHistoryLab.font = [UIFont systemFontOfSize:13];
    }
    return _searchHistoryLab;
}

-(UIButton *)clearBtn {
    
    if (_clearBtn == nil) {
        _clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearBtn.frame = CGRectMake(ScreenW - 15 - 40, 17, 40, 40);
        [_clearBtn setImage:[UIImage imageNamed:@"del_icon"] forState:UIControlStateNormal];
        [_clearBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        [_clearBtn sizeToFit];
        _clearBtn.bb_right = ScreenW - 16;
        [_clearBtn addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_searchTextField becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_searchTextField resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpBase];
    
    [self setUpNavBar];
    
    [self setupUI];
}

-(void)setUpBase{
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setUpNavBar{
    self.navigationItem.titleView = self.searchView;
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:self.cancelSearchBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)setupUI
{
    _remenView = [[UIView alloc]initWithFrame:CGRectMake(0, TopHeight, ScreenW, ScreenH - TopHeight)];
    _remenView.userInteractionEnabled = YES;
    _remenView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_remenView];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [[NSArray alloc] initWithArray:[userDefaultes arrayForKey:@"myArray"]];
    // NSArray --> NSMutableArray
    _searchTextArr = [NSMutableArray array];
    _searchTextArr = [myArray mutableCopy];
    if (_searchTextArr.count > 0) {
        [self searchHistory:_searchTextArr];
    }
}

- (void)searchHistory: (NSMutableArray *)mArr {
    
    self.remenView.backgroundColor = [UIColor whiteColor];
    [self.remenView addSubview:self.searchHistoryLab];
    [self.remenView addSubview:self.clearBtn];
    
    float butX = 10;
    float butY = 50;
    for(int i = 0; i < mArr.count; i++)
    {
        NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        // 限制10字数 的宽度
        NSString *maxSizeStr = @"一一一一一一一一一一一";
        CGSize maxSizeStrSize = [maxSizeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 28) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil].size;
        // 宽度自适应
        CGSize labSize = [mArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 28) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil].size;
        
        CGFloat butWidth = 0;
        if (labSize.width > maxSizeStrSize.width) { // 如果文字的宽度大于最大宽度, 使用最大宽度作为文字宽度
            butWidth = maxSizeStrSize.width;
        } else {
            butWidth = labSize.width;
        }
        
        if (butX + butWidth > ScreenW-28) { // 换行
            
            butX = 10;
            butY += labSize.height * 2 + 9;
        }
        
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(butX, butY, butWidth + 28, 28)];
        if (butWidth + 16>ScreenW - 16 * 2) {
            but.frame = CGRectMake(butX, butY, ScreenW-16*2, 28);
        }
        [but setTitle:mArr[i] forState:UIControlStateNormal];
        [but setTitleColor:RGB(16, 0, 0) forState:UIControlStateNormal];
        but.titleLabel.font = [UIFont systemFontOfSize:12];
        but.layer.cornerRadius = 14;
        but.backgroundColor = RGB(244, 244, 244);
        [but setTitleEdgeInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
        but.tag = i;
        [but addTarget:self action:@selector(searchHistoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        but.titleLabel.lineBreakMode =  NSLineBreakByTruncatingTail; // 省略号放右边
        [_remenView addSubview:but];
        
        butX = CGRectGetMaxX(but.frame)+8;
        
        if (i == mArr.count - 1) {
            
            _remenView.bb_height = but.bb_bottom + 12;
        }
    }
}

// return按钮操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    if ([self.searchTextField.text isEqualToString:@""]) { //如果没有输入任何文字, 不做操作
        
    }else{
        [self searchText:self.searchTextField.text];
        
        SSYSearchResultViewController *searchResultVC = [[SSYSearchResultViewController alloc] init];
//        NavBarSearchViewController *nav = [[NavBarSearchViewController alloc] initWithRootViewController:searchResultVC];
        [self.navigationController pushViewController:searchResultVC animated:YES];
    }
    
    return YES;
}


- (void)backClick {
    
    [self dismissViewControllerAnimated:self completion:nil];
}

- (void)rightmengbutClick {
    
    UIBarButtonItem *item = self.navigationItem.rightBarButtonItem;
    UIButton *button = (UIButton *)item.customView;
    NSString *rightItemStr = button.titleLabel.text;
    NSLog(@"%@", rightItemStr);
    [self searchText:self.searchTextField.text];
    
}

/// 搜索历史按钮点击
- (void)searchHistoryBtnClick:(UIButton *)button {
    
    NSLog(@"%ld",button.tag);
    [self searchText:button.titleLabel.text];
    self.searchTextField.text = button.titleLabel.text;
}

/// 搜索历史
-(void)searchText: (NSString *)seaTxt
{
    [_searchTextField resignFirstResponder];
    // 搜索服务器请求
    [ self getData: seaTxt];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    // 去除字符串两边的空格
    NSString *removeBlackStr = [seaTxt stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //读取数组NSArray类型的数据
    NSArray *myArray = [[NSArray alloc] initWithArray:[userDefaultes arrayForKey:@"myArray"]];
    _searchTextArr = [myArray mutableCopy];
    
    BOOL isEqualTo1,isEqualTo2;
    isEqualTo1 = NO;
    isEqualTo2 = NO;
    
    if (_searchTextArr.count > 0) {
        isEqualTo2 = YES;
        //判断搜索内容是否存在，存在的话放到数组第一位，不存在的话添加。
        for (NSString * str in myArray) {
            if ([removeBlackStr isEqualToString:str]) {
                //获取指定对象的索引
                NSUInteger index = [myArray indexOfObject:removeBlackStr];
                [_searchTextArr removeObjectAtIndex:index];
                if (removeBlackStr != nil && ![removeBlackStr isEqualToString:@""]) {
                    [_searchTextArr insertObject:removeBlackStr atIndex:0];
                }
                isEqualTo1 = YES;
                break;
            }
        }
    }
    
    if (!isEqualTo1 || !isEqualTo2) {
        if (removeBlackStr != nil && ![removeBlackStr isEqualToString:@""]) {
            [_searchTextArr insertObject:removeBlackStr atIndex:0];
        }
    }
    
    if(_searchTextArr.count > 10)
    {
        [_searchTextArr removeObjectAtIndex:_searchTextArr.count - 1];
    }
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_searchTextArr forKey:@"myArray"];
    [[self.remenView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.remenView.backgroundColor = [UIColor redColor];
    [self searchHistory:_searchTextArr];
}

/// 清空
- (void)clear: (UIButton *)button {
    
    [_searchTextArr removeAllObjects];
    //将数据全部从NSUserDefaults中移除
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"myArray"];
    [[self.remenView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.remenView.backgroundColor = [UIColor whiteColor];
}

#pragma mark ----- getData 和服务器交互
- (void)getData: (NSString *)seaTxt {
    NSLog(@"getData 和服务器交互");
}





//取消搜索
-(void)cancelClick{
    [self dismissViewControllerAnimated:NO completion:nil];
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
