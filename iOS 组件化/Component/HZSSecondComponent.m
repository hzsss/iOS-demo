//
//  HZSSecondComponent.m
//  iOS 组件化
//
//  Created by 灿灿 on 2018/5/16.
//  Copyright © 2018年 HZSS. All rights reserved.
//

#import "HZSSecondComponent.h"
#import "HZSSecondController.h"

@implementation HZSSecondComponent
+ (UIViewController *)secondVc {
    HZSSecondController *secondVc = [[HZSSecondController alloc] init];
    return secondVc;
}
@end
