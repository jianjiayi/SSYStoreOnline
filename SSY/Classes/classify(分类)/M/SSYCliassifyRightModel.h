//
//  SSYCliassifyRightModel.h
//  SSY
//
//  Created by 大为科技 on 2018/9/13.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSYCliassifyRightModel : NSObject

//实体SSYCliassifyleftModel中的主键值
@property(nonatomic,assign) long tagID;
//右侧id
@property(nonatomic,assign) long roomID;
//
@property(nonatomic,copy) NSString *roomImgUrl;
//
@property(nonatomic,copy) NSString *roomName;


@end
