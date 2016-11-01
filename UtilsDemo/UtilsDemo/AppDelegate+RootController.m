//
//  AppDelegate+RootController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

/**
 app的跟视图控制器实例
 */

#import "AppDelegate+RootController.h"
#import "TTAMainTabBarController.h"

@implementation AppDelegate (RootController)
/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView {
    
}

/**
 *  设置根视图
 */
- (void)setRootViewController {
    TTAMainTabBarController *mainTabBar = [[TTAMainTabBarController alloc] init];
    
    self.window.rootViewController = mainTabBar;
}
/**
 *  window实例
 */
- (void)setAppWindows {
    self.window = [[UIWindow alloc] initWithFrame:kSCREEN_BOUNDS];
}


@end
