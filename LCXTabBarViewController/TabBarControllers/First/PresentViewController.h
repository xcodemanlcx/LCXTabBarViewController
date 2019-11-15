//
//  PresentViewController.h
//  LCXTabBarViewController
//
//  Created by lcx on 2019/11/15.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "SuperViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PresentViewController : SuperViewController

/*同一导航控制器下， 注意用weak，否则不能释放
 */
@property (nonatomic ,copy) dispatch_block_t dissViewControllerBlock;

@end

NS_ASSUME_NONNULL_END
