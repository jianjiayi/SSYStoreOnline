//
//  AppVersionTool.m
//  SSY
//
//  Created by 大为科技 on 2018/7/25.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "AppVersionTool.h"

@implementation AppVersionTool

//获取保存的上一个版本信息
+(NSString *) GetLastOneAppVersion
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"AppVersion"];
}

//保存最新的版本信息
+(void) SaveNewAppVersion:(NSString *)version{
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"AppVersion"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
