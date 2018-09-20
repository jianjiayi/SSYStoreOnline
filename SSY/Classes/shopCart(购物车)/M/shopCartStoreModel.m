//
//  shopCartStoreModel.m
//  SSY
//
//  Created by 大为科技 on 2018/8/16.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "shopCartStoreModel.h"

@implementation shopCartStoreModel

#pragma mark -init
-(instancetype)init
{
    self = [super init];
    if(self){
        self.goodsArray = [NSMutableArray new];
    }
    return self;
}

//赋值
-(void)setGoods:(NSMutableArray<shopCartGoodsModel *> *)goods{
    _goods = goods;
    NSMutableArray *tempArray = [NSMutableArray new];
    for (NSDictionary *dic in goods) {
        shopCartGoodsModel *model = [[shopCartGoodsModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [tempArray addObject:model];
    }
    self.goodsArray = [NSMutableArray arrayWithArray:tempArray];
}

@end
