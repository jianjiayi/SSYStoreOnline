//
//  shopCartViewController.m
//  SSY
//
//  Created by 大为科技 on 2018/7/24.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartViewController.h"

#import "shopCartStoreModel.h"
#import "shopCartGoodsModel.h"

//导航栏
#import "shopCartTopToolView.h"
//bottom按钮组
#import "shopCartBottomView.h"

//header
#import "shopCartHeaderView.h"
//cell
#import "shopCartItemViewCell.h"

@interface shopCartViewController ()<UITableViewDelegate,UITableViewDataSource>

//tableView
@property(nonatomic,strong) UITableView *tabbleView;

//bottomView
@property(nonatomic,strong) shopCartBottomView *bottomView;

//存放购物车数组
@property(nonatomic,strong)NSMutableArray <shopCartStoreModel *> *storeArray;


//存放选中的商品数组
@property(nonatomic,strong)NSMutableArray *selectArray;

@end

@implementation shopCartViewController

#pragma mark -懒加载
-(UITableView *)tabbleView{
    if(!_tabbleView){
        _tabbleView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopHeight+1, ScreenW, ScreenH-TopHeight-TabBarHeight-44) style:(UITableViewStyleGrouped)];
        _tabbleView.delegate = self;
        _tabbleView.dataSource = self;
//        _tabbleView.separatorStyle = UITableViewCellSelectionStyleNone;//去掉tableView的所有cell分割线
        /**注册**/
        [_tabbleView registerClass:[shopCartHeaderView class] forHeaderFooterViewReuseIdentifier:@"shopCartHeaderViewID"];//header
        [_tabbleView registerClass:[shopCartItemViewCell class] forCellReuseIdentifier:@"shopCartItemViewCellID"];//cell
    }
    return _tabbleView;
}

-(shopCartBottomView *)bottomView
{
    if(!_bottomView){
        _bottomView = [[shopCartBottomView alloc] init];
        _bottomView.frame = CGRectMake(0, ScreenH-TabBarHeight-44, ScreenW, 44);
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
//购物车数组
-(NSMutableArray<shopCartStoreModel *> *)storeArray
{
    if(!_storeArray){
        _storeArray = [NSMutableArray new];
    }
    return _storeArray;
}
//选中商品保存数组
-(NSMutableArray *)selectArray
{
    if(!_selectArray){
        _selectArray = [NSMutableArray new];
    }
    return _selectArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏
    [self setUpNavbar];
    //底部按钮组
    [self setUpBottomView];
    //tabbleview
    [self setUpTableView];
    //加载数据
    [self loadingDataForPlist];
}


//创建导航栏
-(void)setUpNavbar{
    self.navigationController.navigationBar.hidden = YES;//隐藏导航栏
    shopCartTopToolView *topToolView = [shopCartTopToolView new];
    topToolView.frame = CGRectMake(0, 0, ScreenW, TopHeight);
    topToolView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topToolView];
    
    topToolView.EditClickBlock = ^(BOOL isClick) {
        if(isClick){
            self.bottomView.allPriceLabel.hidden = YES;
            self.bottomView.clearingBtn.hidden = YES;
            self.bottomView.deleteBtn.hidden = NO;
            self.bottomView.concernBtn.hidden = NO;
        }else{
            self.bottomView.allPriceLabel.hidden = NO;
            self.bottomView.clearingBtn.hidden = NO;
            self.bottomView.deleteBtn.hidden = YES;
            self.bottomView.concernBtn.hidden = YES;
        }
    };
}
//创建底部按钮组
-(void)setUpBottomView{
    [self clickBottomView:self.bottomView];
    [self.view addSubview:self.bottomView];
}
//创建tableView
-(void)setUpTableView{
    [self.view addSubview:self.tabbleView];
}


#pragma mark -------------------- <UITableViewDataSource>------------------------------

//共有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.storeArray.count;//返回商家数量
}
//每组有多少cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    shopCartStoreModel *storeModel = self.storeArray[section];//根据section获取摸个商家
    NSLog(@"11111:+%ld",storeModel.goodsArray.count);
    return storeModel.goodsArray.count;//返回商家的商品数量
}
//每组头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *headerView = nil;
    shopCartHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"shopCartHeaderViewID"];
    header.contentView.backgroundColor = [UIColor whiteColor];
    shopCartStoreModel *storeModel = self.storeArray[section];//获取数据
    header.storeModel = storeModel;//设置数据模型
    //分区 区头点击事件 --- 把事件分离
    [self clickSectionHeaderView:header andShopCartStoreModel:storeModel];
     headerView = header;
    return headerView;
}
//每个cell包含内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tableCell = nil;
    shopCartItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopCartItemViewCellID"];
    cell.separatorInset = UIEdgeInsetsMake(0, ScreenW, 0, 0);
    shopCartStoreModel *storeModel = self.storeArray[indexPath.section];
    shopCartGoodsModel *goodsModel = storeModel.goodsArray[indexPath.row];
    cell.goodsModel = goodsModel;
    //商品点击事件 --- 事件分离
    [self clickCellView:cell storeModel:storeModel goodsModel:goodsModel indexPath:indexPath];
    tableCell = cell;
    return tableCell;
}

#pragma mark ----------------------- <UITableViewDelegate> -------------------------------

//组头行高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

//cell行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

//操作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了。。");
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置可以左滑操作
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//添加左滑按钮
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"您点击了删除！");
        [self deleteGoodsWithIndexPath:indexPath];
    }];
    deleteAction.backgroundColor = [UIColor colorWithRed:72/255.0 green:188/255.0 blue:119/255.0 alpha:1/1.0];

    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"您点击了关注");
    }];
    editAction.backgroundColor =  [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1/1.0];
    return @[deleteAction,editAction];
}
//左滑按钮点击事件
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    editingStyle = UITableViewCellEditingStyleDelete;
}





#pragma mark -------------------------------------点击按钮  逻辑处理-------------------------

/*
 判断某商家下所有商品是否被全选
 @param section 商家index
 */
-(void)judgeIsSelectSection:(NSInteger)section{
    shopCartStoreModel *storeModel = self.storeArray[section];//获取某商家模型
    BOOL isSelectSection = YES;//声明一个状态变量
    //遍历商家下所有商品,若有商品没有被选择，跳出循环，说明没有全选
    for(shopCartGoodsModel *goodsModel in storeModel.goodsArray){
        if(goodsModel.isSelect == NO){
            isSelectSection = NO;
            break;
        }
    }
    //选择了以后，改变一下选中状态
    shopCartHeaderView *headerView = (shopCartHeaderView *)[self.tabbleView headerViewForSection:section];//获取tableView中的某商家headerView
    headerView.isClick = isSelectSection;//修改状态
    storeModel.isSelect = isSelectSection;
}

/*
 判断时候全选
 */
-(void)judgeIsAllSelect{
    //声明变量count，用来保存购物车商品总数
    NSInteger count = 0;
    //遍历购物车所有商品，获取总商品件数
    for(shopCartStoreModel *storeModel in self.storeArray){
        count += storeModel.goodsArray.count;
    }
    //如果购物车商品总数==已选中商品总是，则全选
    if(count == self.selectArray.count){
        self.bottomView.isClick = YES;
    }else{
        self.bottomView.isClick = NO;
    }
}

/*
 计算价格
 */
-(void)countPrice{
    //声明变量totlePrice，保存总价
    double totlePrice = 0.0;
    int totleNum = 0;
    //遍历所有已选中的商品，计算总价
    for(shopCartGoodsModel *goodsModel in self.selectArray){
        double price = [goodsModel.goodsPrice doubleValue];//获取商品单价
        totlePrice += price*[goodsModel.count integerValue];
        totleNum += [goodsModel.count integerValue];
    }
    self.bottomView.clearingBtn.titleLabel.text = [NSString stringWithFormat:@"计算 (%d)",totleNum];
    self.bottomView.allPriceLabel.text = [NSString stringWithFormat:@"合计 ￥%.2f",totlePrice];
}


#pragma mark --------------------------------------按钮 点击事件-------------------------
/*
 headerView头点击---选中某个商家、取消选中
 @param headerView 某商家header
 @param storeModel 商家模型
 */
-(void)clickSectionHeaderView:(shopCartHeaderView *)headerView andShopCartStoreModel:(shopCartStoreModel *)storeModel{
    headerView.shopClickBlock = ^(BOOL isClick){
        NSLog(@"您点击了选择商家");
        //修改商家选中状态
        storeModel.isSelect = isClick;
        if(isClick){//选中
            //遍历该商家所有商品
            for(shopCartGoodsModel *goodsModel in storeModel.goodsArray){
                goodsModel.isSelect = YES;
                if(![self.selectArray containsObject:goodsModel]){//如果已选商品数组，不包含此商品，则添加到已选商品数组
                    [self.selectArray addObject:goodsModel];
                }
            }
        }else{//取消
            for (shopCartGoodsModel *goodsModel in storeModel.goodsArray) {
                goodsModel.isSelect = NO;//修改商品选中状态
                if([self.selectArray containsObject:goodsModel]){//如果已选商品数组，包含此商品，删除此商品
                    [self.selectArray removeObject:goodsModel];
                }
            }
        }
        [self judgeIsAllSelect];//判断是否全选
        [self countPrice];//计算总价
        [self.tabbleView reloadData];//刷新数据
    };
}

/*
 cell点击--选中某个商品、取消选中
 @param cell 某商品cell
 @param storeModel 某商家模型
 @param goodsModel 某商品模型
 @param indexPath  某商品index
 */
-(void)clickCellView:(shopCartItemViewCell *)cell
          storeModel:(shopCartStoreModel *)storeModel
          goodsModel:(shopCartGoodsModel *)goodsModel
           indexPath:(NSIndexPath *) indexPath
{
    //选择某商品
    cell.ClickRowBlock = ^(BOOL isClick) {
        goodsModel.isSelect = isClick;
        if(isClick){//全选
            [self.selectArray addObject:goodsModel];
        }else{//取消
            [self.selectArray removeObject:goodsModel];
        }
        [self judgeIsSelectSection:indexPath.section];//该商家是否全选
        [self judgeIsAllSelect];//是否全选
        [self countPrice];//计算总价
    };
    //加法
    cell.AddBlock = ^(UILabel *numberLabel) {
        goodsModel.count = numberLabel.text;
        //修改模型，先根据indexPath.row删除，再添加
        [storeModel.goodsArray replaceObjectAtIndex:indexPath.row withObject:goodsModel];
        if([self.selectArray containsObject:goodsModel]){//如果已选数组包含该商品，先删除掉，再添加上
            [self.selectArray removeObject:goodsModel];
            [self.selectArray addObject:goodsModel];//计算总价
            [self countPrice];
        }
    };
    //减法
    cell.CutBlock = ^(UILabel *numberLabel) {
        goodsModel.count = numberLabel.text;
        //修改模型，先根据indexPath.row删除，再添加
        [storeModel.goodsArray replaceObjectAtIndex:indexPath.row withObject:goodsModel];
        if([self.selectArray containsObject:goodsModel]){//如果已选数组包含该商品，先删除掉，再添加上
            [self.selectArray removeObject:goodsModel];
            [self.selectArray addObject:goodsModel];//计算总价
            [self countPrice];
        }
    };
}

/*
 bottomView 底部按钮组合点击
 @param bottomView 底部view
 */
-(void)clickBottomView:(shopCartBottomView *)bottomView{
    bottomView.AllClickBlock = ^(BOOL isClick) {
        NSLog(@"您点击了全选按钮");
        //遍历已选商品数组,将商品取消选中
        for (shopCartGoodsModel *goodsModel in self.selectArray) {
            goodsModel.isSelect = NO;
        }
        //先清空已选商品数组
        [self.selectArray removeAllObjects];
        if(isClick){//全选
            //遍历所有商家 ，将所有商品 添加到已选商品数组中
            for (shopCartStoreModel *storeModel in self.storeArray) {
                storeModel.isSelect = YES;//店铺选中
                for (shopCartGoodsModel *goodsModel in storeModel.goodsArray) {
                    goodsModel.isSelect = YES;//商品选中
                    [self.selectArray addObject:goodsModel];//所有商品添加到已选数组中
                }
            }
        }else{//取消
            //遍历所有商家，取消全选
            for (shopCartStoreModel *storeModel in self.storeArray) {
                storeModel.isSelect = NO;
            }
        }
        //刷新tabbleView数据
        [self.tabbleView reloadData];
        //计算总价
        [self countPrice];
    };
}

/*
 删除某商品
 @parma indexPath坐标
 */
-(void)deleteGoodsWithIndexPath:(NSIndexPath *)indexPath{
    shopCartStoreModel *storeModel = [self.storeArray objectAtIndex:indexPath.section];//找到该商家
    shopCartGoodsModel *goodsModel = [storeModel.goodsArray objectAtIndex:indexPath.row];//找到该商品
    [storeModel.goodsArray removeObjectAtIndex:indexPath.row];//移除该商品
    [self.tabbleView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //判断 如果该商家没有商品了，则移除该 该商家
    if(storeModel.goodsArray.count == 0){
        [self.storeArray removeObjectAtIndex:indexPath.section];
    }
    //判断 如果该商品 是已选商品，则要在已选商品删除
    if([self.selectArray containsObject:goodsModel]){
        [self.selectArray removeObject:goodsModel];
        [self countPrice];
    }
    
//    [self judgeIsSelectSection:indexPath.section];//该商家是否全选
//    [self judgeIsAllSelect];//是否全选
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tabbleView reloadData];
    });
    
}


#pragma mark ------------------加载plist文件内容-----------------
-(void)loadingDataForPlist{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shopCartList" ofType:@"plist"];
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *dataArray = dataDic[@"data"];
    if(dataArray.count > 0){
        for (NSDictionary *dic in dataArray) {
            shopCartStoreModel *model = [[shopCartStoreModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.storeArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabbleView reloadData];
        });
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
