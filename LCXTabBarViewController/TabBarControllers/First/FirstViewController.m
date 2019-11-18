//
//  FirstViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/14.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "FirstViewController.h"
#import "NextViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)nextAction:(UIButton *)sender{
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
