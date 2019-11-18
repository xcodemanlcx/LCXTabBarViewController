//
//  FourViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/15.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "FourViewController.h"
#import "FourNextViewController.h"
#import "FourPresentViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController
{
    BOOL _isPresentVC;
}

#pragma mark - 导航隐藏时，push也有动画效果

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (!_isPresentVC ){
        if (self.navigationController.navigationBar.isHidden == NO) {
            [self.navigationController setNavigationBarHidden:YES animated:animated];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (!_isPresentVC ){
        if (self.navigationController.navigationBar.isHidden == YES) {
            [self.navigationController setNavigationBarHidden:NO animated:animated];
        }
    }else{
        
        //消失前重置，默认为导航模式
        _isPresentVC = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.brownColor;
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 40+100, UIScreen_Width, 60);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(presentAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 40+100*2, UIScreen_Width, 60);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"push" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)presentAction:(UIButton *)sender{
    _isPresentVC = YES;
    [self presentViewController:[FourPresentViewController new] animated:YES completion:nil];
}

- (void)pushAction:(UIButton *)sender{
    [self.navigationController pushViewController:[FourNextViewController new] animated:YES];
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
