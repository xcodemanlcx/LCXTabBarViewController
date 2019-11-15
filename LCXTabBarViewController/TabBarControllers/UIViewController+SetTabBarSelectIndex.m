//
//  UIViewController+SetTabBarSelectIndex.m
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/15.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIViewController+SetTabBarSelectIndex.h"
#import "LCXTabBarViewController.h"
@implementation UIViewController (SetTabBarSelectIndex)

- (void)setTabBarSelectIndex:(NSInteger )tabBarSelectIndex{
    if ([self.view.window.rootViewController isKindOfClass:LCXTabBarViewController.class]) {
        LCXTabBarViewController *tabBarController = (LCXTabBarViewController *)self.view.window.rootViewController;
        [tabBarController setCustomTabBarSelectIndex:tabBarSelectIndex];
    }
}

@end
