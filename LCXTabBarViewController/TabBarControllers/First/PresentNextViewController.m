//
//  PresentNextViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/18.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "PresentNextViewController.h"
#import "LCXTabBarViewController.h"

@interface PresentNextViewController ()

@end

@implementation PresentNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 40+100*3, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(changeKeywindowRootViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"创建新keywindow rootViewController" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)changeKeywindowRootViewControllerAction:(UIButton *)sender{
    /*UIWindow的rootViewController赋新值，present 的ViewController不会自动释放，需dismissViewCodissntroller来释放；
     */
    [self dismissViewControllerAnimated:NO completion:^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        keyWindow.rootViewController = [LCXTabBarViewController new];
    }];
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
