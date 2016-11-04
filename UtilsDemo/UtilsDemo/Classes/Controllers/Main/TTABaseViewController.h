//
//  TTABaseViewController.h
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTABaseViewController : UIViewController

/**
 设置 UI
 */
- (void)setupUI;

/**
 获取数据
 */
- (void)getData;

/**
 *  显示没有数据页面
 */
- (void)showNoDataImage;

/**
 *  移除无数据页面
 */
- (void)removeNoDataImage;

/**
 *  需要登录
 */
- (void)showShouldLoginPoint;

/**
 *  加载视图
 */
- (void)showLoadingAnimation;

/**
 *  停止加载
 */
- (void)stopLoadingAnimation;

- (void)goLogin;

/**
 *  状态栏
 */
- (void)initStatusBar;

- (void)showStatusBarWithTitle:(NSString *)title;

- (void)changeStatusBarTitle:(NSString *)title;
- (void)hiddenStatusBar;
@end
