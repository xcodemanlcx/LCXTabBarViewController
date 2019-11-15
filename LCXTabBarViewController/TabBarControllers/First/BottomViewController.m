//
//  BottomViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/14.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "BottomViewController.h"
#import "UIViewController+SetTabBarSelectIndex.h"
#import "LCXTabBarViewController.h"
#import "PresentViewController.h"

@interface BottomViewController ()

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 40+100*1, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(backToRootViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"pop to rootViewController" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 40+100*2, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(changeItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"切换tabbar Item" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 40+100*3, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(changeWindowRootViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"切换rootViewController" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(0, 40+100*4, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(presentViewControllerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"presentViewController" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)backToRootViewControllerAction:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)changeItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:NO];
    [self setTabBarSelectIndex:1];
}

- (void)changeWindowRootViewControllerAction:(UIButton *)sender{

    /*UIWindow的rootViewController赋新值时，导航控制器push 的所有ViewController会被pop自动释放；
     */
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[LCXTabBarViewController alloc] init];
}

- (void)presentViewControllerAction:(UIButton *)sender{
    PresentViewController *presentViewController = [PresentViewController new];
    __weak typeof (self) weakSelf = self;
    presentViewController.dissViewControllerBlock = ^{
        __strong typeof (weakSelf) strongSelf = weakSelf;
        
        [strongSelf.navigationController popToRootViewControllerAnimated:NO];

        [self setTabBarSelectIndex:1];
    };
    
    [self presentViewController:presentViewController animated:YES completion:nil];
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
