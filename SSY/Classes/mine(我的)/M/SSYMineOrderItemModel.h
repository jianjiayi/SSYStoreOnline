//
//  SSYMineOrderItemModel.h
//  SSY
//
//  Created by 大为科技 on 2018/9/17.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSYMineOrderItemModel : NSObject

//id
@property(nonatomic,assign) long tagID;
//icon
@property(nonatomic,strong) NSString *iconUrl;
//文字
@property(nonatomic,strong) NSString *iconName;
//提示
@property(nonatomic,assign) long tagNum;

@end
