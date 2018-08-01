//
//  AppDelegate.m
//  iOS 组件化
//
//  Created by 灿灿 on 2018/5/16.
//  Copyright © 2018年 HZSS. All rights reserved.
//

#import "AppDelegate.h"
#import "HZSBasicController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *nav;
@property (nonatomic, strong) UIViewController *basicVc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // testhaha
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HZSBasicController *basicVc = [[HZSBasicController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:basicVc];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    self.nav = nav;
    self.basicVc = basicVc;
    
    [self simulateRemoteNotification];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [self simulateJumpWithDict:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)simulateJumpWithDict:(NSDictionary *)dict {
    // 反射所要的类，初始化控制器
    Class class = NSClassFromString(dict[@"className"]);
    
    UIViewController *vc = [[class alloc] init];
    
    // 获取参数
    NSString *str = dict[@"property"];
    
    if ([vc respondsToSelector:NSSelectorFromString(@"str")]) {
        [str setValue:str forKey:@"name"];
    }
    
    [self.nav pushViewController:vc animated:YES];
    
    SEL selector = NSSelectorFromString(dict[@"method"]);
    
    [vc performSelector:selector];
    
}

- (void)simulateRemoteNotification {
    // 模拟获取远程数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *dict = @{
                               // 类名
                               @"className" : @"HZSFirstController",
                               // 参数
                               @"property" : @"be yourself, everyone else is already taken",
                               // 调用方法名
                               @"method" : @"upDateInformation"
                               };
        [self application:[UIApplication sharedApplication] didReceiveRemoteNotification:dict fetchCompletionHandler:^(UIBackgroundFetchResult result) {
            
        }];
    });
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
