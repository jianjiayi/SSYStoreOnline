//
//  SSYClassifyLeftModel.h
//  SSY
//
//  Created by 大为科技 on 2018/9/13.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSYClassifyLeftModel : NSObject

//id
@property(nonatomic,assign) long tagID;
//名称
@property(nonatomic,copy) NSString *tagName;
//图表地址
@property(nonatomic,copy) NSString *tagImgUrl;
//这个来定位右边数据源滚动位置
@property(nonatomic,assign) float offsetScorller;


@end
