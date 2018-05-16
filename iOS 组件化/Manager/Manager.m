//
//  Manager.m
//  iOS 组件化
//
//  Created by 灿灿 on 2018/5/16.
//  Copyright © 2018年 HZSS. All rights reserved.
//

#import "Manager.h"

@implementation Manager
+ (UIViewController *)secondComponent {
    Class cls = NSClassFromString(@"HZSSecondComponent");
    
    return [cls performSelector:NSSelectorFromString(@"secondVc")];
}

+ (UIViewController *)thirdComponent {
    Class cls = NSClassFromString(@"HZSThirdComponent");
    
    return [cls performSelector:NSSelectorFromString(@"thirdVc")];
}
@end
