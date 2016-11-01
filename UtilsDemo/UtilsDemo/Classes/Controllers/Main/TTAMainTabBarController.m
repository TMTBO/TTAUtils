//
//  MainTabBarController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 01/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTAMainTabBarController.h"
#import "TTABaseTableViewController.h"
#import "TTABaseCollectionViewController.h"

@interface TTAMainTabBarController ()

@end

@implementation TTAMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabbarController];
}

/**
 *  tabbar实例
 */
- (void)setTabbarController {
    TTABaseViewController *baseVc = [[TTABaseViewController alloc] init];
    TTABaseTableViewController *baseTableVc = [[TTABaseTableViewController alloc] init];
    TTABaseCollectionViewController *baseCollectionVc = [[TTABaseCollectionViewController alloc] init];
    
    [self configChildViewController:baseVc title:@"baseVc" imageName:nil];
    [self configChildViewController:baseTableVc title:@"baseTableVc" imageName:nil];
    [self configChildViewController:baseCollectionVc title:@"baseCollectionVc" imageName:nil];
}


/**
 配置子控制器和 tabbar

 @param childViewController  子控制器
 @param title                子控制器标题
 @param imageName            图片名
 */
- (void)configChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName {
    if (title) {
        childViewController.title = title;
        // 算定义 title 颜色
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kLIGHT_GRAY_COLOR} forState:UIControlStateNormal];
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kGREEN_COLOR} forState:UIControlStateSelected];
    }
    
    if (imageName) {
        childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
        // 根据imageName 设置选中图片名,格式为:imageName_sel
        childViewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", imageName]];
    }
    
    UINavigationController *naVc = [[UINavigationController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:naVc];
}



@end
