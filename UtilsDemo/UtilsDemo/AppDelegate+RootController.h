//
//  AppDelegate+RootController.h
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

/**
 app的跟视图控制器实例
 */

#import "AppDelegate.h"

@interface AppDelegate (RootController)

/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView;
/**
 *  tabbar实例
 */
- (void)setTabbarController;

/**
 *  window实例
 */
- (void)setAppWindows;

/**
 *  设置根视图
 */
- (void)setRootViewController;

@end
