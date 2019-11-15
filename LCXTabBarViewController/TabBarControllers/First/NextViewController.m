//
//  NextViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/14.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NextViewController.h"
#import "BottomViewController.h"


@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 40+100, UIScreen_Width, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 40+100*2, UIScreen_Width, 60);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"push" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushAction:(UIButton *)sender{
    [self.navigationController pushViewController:[BottomViewController new] animated:YES];
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
