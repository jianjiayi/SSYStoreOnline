//
//  recommendItem.h
//  SSY
//
//  Created by 大为科技 on 2018/7/26.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface recommendItem : NSObject

//图片url
@property(nonatomic,copy) NSString *image_url;

//商品标题
@property(nonatomic,copy) NSString *main_titile;

//商品副标题
@property(nonatomic,copy) NSString *goods_title;

//商品价格
@property(nonatomic,copy) NSString *price;

//商品库存
@property(nonatomic,copy) NSString *stock;

//商品分类
@property(nonatomic,copy) NSString *nature;

//商品轮播图
@property(nonatomic,copy) NSArray *images;

@end
