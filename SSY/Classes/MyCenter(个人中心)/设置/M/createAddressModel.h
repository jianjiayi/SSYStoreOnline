//
//  createAddressModel.h
//  SSY
//
//  Created by 大为科技 on 2018/8/31.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface createAddressModel : NSObject

@property(nonatomic,assign) int id;
//收件人姓名
@property(nonatomic,copy) NSString *name;
//收件人手机号
@property(nonatomic,copy) NSString *phone;
//收件人地址
@property(nonatomic,copy) NSString *address;

//是否默认按钮
@property(nonatomic,assign) BOOL isSelect;

@end
