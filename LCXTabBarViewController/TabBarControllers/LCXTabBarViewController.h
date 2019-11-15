//
//  LCXTabBarViewController.h
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/14.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define BaseTag 100

@interface LCXTabBarViewController : UITabBarController

- (void)setCustomTabBarSelectIndex:(NSInteger)customTabBarSelectIndex;

@end

NS_ASSUME_NONNULL_END
