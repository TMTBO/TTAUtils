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

+ (instancetype)sharedAppDelegate;

/**
 *  首次启动轮播图
 */
- (void)createLoadingScrollView;

/**
 *  window实例
 */
- (void)setAppWindows;

/**
 *  设置根视图
 */
- (void)setRootViewController;

/** 代码中尽量改用以下方式去push/pop/present界面 */
- (UINavigationController *)navigationViewController;

- (UIViewController *)topViewController;

- (void)pushViewController:(UIViewController *)viewController;

- (NSArray *)popToViewController:(UIViewController *)viewController;
/** pop到栈中最顶层的对应的 class 的Vc */
- (void)popToViewControllerWithClass:(Class)aClass;
/** pop到栈中,从当前显示页面算起,之前显示的第 aIndex 个界面 */
- (void)popToViewControllerWithindex:(NSInteger)aIndex;

- (UIViewController *)popViewController;

- (NSArray *)popToRootViewController;

- (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)())completion;
- (void)dismissViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)())completion;

@end
