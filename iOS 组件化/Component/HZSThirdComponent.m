//
//  HZSThirdComponent.m
//  iOS 组件化
//
//  Created by 灿灿 on 2018/5/16.
//  Copyright © 2018年 HZSS. All rights reserved.
//

#import "HZSThirdComponent.h"
#import "HZSThirdController.h"
@implementation HZSThirdComponent
+ (UIViewController *)thirdVc {
    HZSThirdController *thirdVc = [[HZSThirdController alloc] init];
    return thirdVc;
}
@end
