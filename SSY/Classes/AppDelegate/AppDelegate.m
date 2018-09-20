//
//  AppDelegate.m
//  SSY
//
//  Created by 大为科技 on 2018/7/20.
//  Copyright © 2018年 dwbeijing. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "tabBarViewController.h"

#import "AppVersionTool.h"
#import "Masonry.h"



@interface AppDelegate ()
//获取当前版本号
#define BUNDLE_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1/1.0];
    NSLog(@"version:%tu",BUNDLE_VERSION);
    if([BUNDLE_VERSION isEqualToString:[AppVersionTool GetLastOneAppVersion]]){//判断是否当前版本号等于上一次储存的版本号
        _window.rootViewController = [[tabBarViewController alloc] init];
        NSLog(@"没有更新");
    }else{
        NSLog(@"有更新....");
        [AppVersionTool SaveNewAppVersion:BUNDLE_VERSION];//保存当前最新版本号
        NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
        if(![useDef boolForKey:@"notFirst"]){
            NSLog(@"第一次打开应用....");
            _window.rootViewController = [[GuideViewController alloc] init];
        }else{
            NSLog(@"....");
            _window.rootViewController = [[tabBarViewController alloc] init];
        }
    }
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
