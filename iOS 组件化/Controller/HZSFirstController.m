//
//  HZSFirstController.m
//  iOS 组件化
//
//  Created by 灿灿 on 2018/5/16.
//  Copyright © 2018年 HZSS. All rights reserved.
//

#import "HZSFirstController.h"
#import "Manager.h"

@interface HZSFirstController ()
@property (nonatomic, strong) UILabel *label;

@end

@implementation HZSFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];
}

- (void)setUp {
    self.title = @"HZSFirstController";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blueColor];
    label.frame = CGRectMake(100, 100, 500, 100);
    [self.view addSubview:label];
    self.label = label;
    
    UIButton *jump2SecondBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    jump2SecondBtn.frame = CGRectMake(100, 200, 200, 100);
    [jump2SecondBtn setTitle:@"跳转到第二个界面" forState:UIControlStateNormal];
    [jump2SecondBtn setTintColor:[UIColor blueColor]];
    
    [jump2SecondBtn addTarget:self action:@selector(jump2SecondVc:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jump2SecondBtn];
    
    UIButton *jump2ThirdBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    jump2ThirdBtn.frame = CGRectMake(100, 300, 200, 100);
    [jump2ThirdBtn setTitle:@"跳转到第二个界面" forState:UIControlStateNormal];
    [jump2ThirdBtn setTintColor:[UIColor blueColor]];
    
    [jump2ThirdBtn addTarget:self action:@selector(jump2ThirdVc:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jump2ThirdBtn];
}

- (void)upDateInformation {
    self.label.text = self.name;
}

- (void)jump2SecondVc:(NSString *)name {
    UIViewController *secondVc = [Manager secondComponent];
    [self.navigationController pushViewController:secondVc animated:YES];
}

- (void)jump2ThirdVc:(NSString *)name {
    UIViewController *thirdVc = [Manager thirdComponent];
    [self.navigationController pushViewController:thirdVc animated:YES];
    
}
@end
