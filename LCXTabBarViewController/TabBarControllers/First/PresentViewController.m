//
//  PresentViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/15.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "PresentViewController.h"
#import "UIViewController+SetTabBarSelectIndex.h"
#import "LCXTabBarViewController.h"
#import "PresentNextViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 40+100*1, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dismissViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 40+100*2, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(changeTabBarItem:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"切换 tabBar item" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 40+100*3, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(changeKeywindowRootViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"创建新keywindow rootViewController" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(0, 40+100*4, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"push" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)dismissViewControllerAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeTabBarItem:(UIButton *)sender{
    __weak typeof (self) weakSelf = self;
    [self dismissViewControllerAnimated:NO completion:^{
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf.dissViewControllerBlock) {
            strongSelf.dissViewControllerBlock();
        }
    }];
}

- (void)changeKeywindowRootViewControllerAction:(UIButton *)sender{
    /*UIWindow的rootViewController赋新值，present 的ViewController不会自动释放，需dismissViewCodissntroller来释放；
     */
    [self dismissViewControllerAnimated:NO completion:^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        keyWindow.rootViewController = [LCXTabBarViewController new];
    }];
}

- (void)pushAction:(UIButton *)sender{
    [self.navigationController pushViewController:[PresentNextViewController new] animated:YES];
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
