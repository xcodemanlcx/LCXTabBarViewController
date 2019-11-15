//
//  LCXTabBarViewController.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/14.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXTabBarViewController.h"
#import "BaseNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#define UIScreen_Width [UIScreen mainScreen].bounds.size.width

@interface LCXTabBarViewController ()

@end

@implementation LCXTabBarViewController
{
    NSArray *_titles;
}
- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViewControllers];
    [self customTabBar];
}

- (void)initViewControllers{
    NSArray *viewControllerNames = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"FourViewController"];
    NSMutableArray *controllers = @[].mutableCopy;
    for (int i = 0; i < viewControllerNames.count; i++) {
        UIViewController *vc = [NSClassFromString(viewControllerNames[i]) new];
        if (i == 2) {
            [controllers addObject:vc];
        }else{
            BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
            vc.navigationItem.title = viewControllerNames[i];
            [controllers addObject:nav];
        }
    }
    self.viewControllers = controllers;
}

- (void)customTabBar{
    self.tabBar.barTintColor = [UIColor orangeColor];
    /*
        解决push与model后再push，viewController来回切换时底部tabbar显示问题；
        优于自定义UITabbar方案 https://www.jianshu.com/p/35922343281b
     */
    if (@available(iOS 11.0, *)) {
        self.tabBar.translucent = NO;
    }

    _titles = @[@"First",@"Second",@"Third",@"Four"];
    for (int i = 0; i < _titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0+i*UIScreen_Width/_titles.count, 0, UIScreen_Width/_titles.count, 49);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.reversesTitleShadowWhenHighlighted = YES;
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTag:BaseTag+i];
        [self.tabBar addSubview:btn];

        if (i==self.selectedIndex)
        {
            btn.selected = YES;
        }
    }
}

- (void)btnAction:(UIButton *)sender{
    if (sender.selected) return;
    UIButton *btn = [self.tabBar viewWithTag:BaseTag+self.selectedIndex];
    if (btn && [btn isKindOfClass:UIButton.class]){
        btn.selected = NO;
        sender.selected = YES;
        self.selectedIndex = sender.tag - BaseTag;
    }
}

- (void)setCustomTabBarSelectIndex:(NSInteger)customTabBarSelectIndex{
    
    if (customTabBarSelectIndex > _titles.count-1 || customTabBarSelectIndex < 0) return;
    UIButton *sender = [self.tabBar viewWithTag:BaseTag+customTabBarSelectIndex];
    if ([sender isKindOfClass:UIButton.class]) {
        [self  btnAction:sender];
    }
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
