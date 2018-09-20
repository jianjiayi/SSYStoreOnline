//
//  shopCartStoreModel.h
//  SSY
//
//  Created by 大为科技 on 2018/8/16.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "shopCartGoodsModel.h"

@interface shopCartStoreModel : NSObject

//商家ID
@property(nonatomic,copy) NSString *shopID;
//icon
@property(nonatomic,copy) NSString *shopIcon;
//name
@property(nonatomic,copy) NSString *shopName;
//商品数组
@property(nonatomic,strong) NSArray *goods;

//是否选择
@property(nonatomic,assign) BOOL isSelect;
//
@property(nonatomic,strong) NSMutableArray *goodsArray;

@end
