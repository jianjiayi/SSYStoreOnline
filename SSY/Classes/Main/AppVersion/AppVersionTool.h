//
//  AppVersionTool.h
//  SSY
//
//  Created by 大为科技 on 2018/7/25.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppVersionTool : NSObject

//获取之前保存的版本
//return NSString类型的 AppVersion
+(NSString *) GetLastOneAppVersion;

//保存最新的版本
+(void) SaveNewAppVersion:(NSString *)version;


@end
