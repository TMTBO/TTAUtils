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
#import "TTABaseViewController.h"
#import "TTAMainTabBarController.h"

@implementation AppDelegate (RootController)

+ (instancetype)sharedAppDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

/** 首次启动轮播图 */
- (void)createLoadingScrollView {
    
}

/** 设置根视图 */
- (void)setRootViewController {
    TTAMainTabBarController *mainTabBar = [[TTAMainTabBarController alloc] init];
    
    self.window.rootViewController = mainTabBar;
}
/** window实例 */
- (void)setAppWindows {
    self.window = [[UIWindow alloc] initWithFrame:kSCREEN_BOUNDS];
}

/** 获取当前活动的navigationcontroller */
- (UINavigationController *)navigationViewController {
    if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)self.window.rootViewController;
    }
    else if ([self.window.rootViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectVc = [((UITabBarController *)self.window.rootViewController) selectedViewController];
        if ([selectVc isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)selectVc;
        }
    }
    return nil;
}

- (UIViewController *)topViewController {
    UINavigationController *nav = [self navigationViewController];
    return nav.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController {
    @autoreleasepool {
        viewController.hidesBottomBarWhenPushed = YES;
        [[self navigationViewController] pushViewController:viewController animated:YES];
    }
}

- (UIViewController *)popViewController {
    return [[self navigationViewController] popViewControllerAnimated:YES];
}
- (NSArray *)popToRootViewController {
    return [[self navigationViewController] popToRootViewControllerAnimated:YES];
}

- (NSArray *)popToViewController:(UIViewController *)viewController {
    return [[self navigationViewController] popToViewController:viewController animated:YES];
}

/** pop到栈中最顶层的对应的 class 的Vc */
- (void)popToViewControllerWithClass:(Class)aClass {
    NSAssert([aClass isSubclassOfClass:[UIViewController class]], @"Here need a UIViewController's subclass");
    
    [[self navigationViewController].viewControllers enumerateObjectsWithOptions: NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull Vc, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([Vc isMemberOfClass:aClass]) {
            [self popToViewController:Vc];
            *stop = YES;
        }
    }];
}

/** pop到栈中,从当前显示页面算起,之前显示的第 aIndex 个界面 */
- (void)popToViewControllerWithindex:(NSInteger)aIndex {
    NSArray *viewControllers = [self navigationViewController].viewControllers;
    NSInteger VcIdx = viewControllers.count - aIndex;
    TTABaseViewController *Vc = viewControllers[VcIdx > 0 ? VcIdx : 0];
    [self popToViewController:Vc];
}

- (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)())completion {
    UIViewController *top = [self topViewController];
    
    if (vc.navigationController == nil) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [top presentViewController:nav animated:animated completion:completion];
    }
    else {
        [top presentViewController:vc animated:animated completion:completion];
    }
}

- (void)dismissViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)())completion {
    if (vc.navigationController != [AppDelegate sharedAppDelegate].navigationViewController) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [vc.navigationController popViewControllerAnimated:YES];
    }
}


@end
