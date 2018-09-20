//
//  shopCartGoodsModel.h
//  SSY
//
//  Created by 大为科技 on 2018/8/16.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopCartGoodsModel : NSObject

//商品ID
@property(nonatomic,copy) NSString *goodsID;
//商品图片
@property(nonatomic,copy) NSString *goodsImage;
//商品标题
@property(nonatomic,copy) NSString *goodsName;
//商品规格
@property(nonatomic,copy) NSString *goodsSpec;
//商品单价
@property(nonatomic,copy) NSString *goodsPrice;
//购买数量
@property(nonatomic,copy) NSString *count;
//是否被选择
@property(nonatomic,assign) BOOL isSelect;


@end
