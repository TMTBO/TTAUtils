//
//  TTABaseViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseViewController.h"

@interface TTABaseViewController () <UIGestureRecognizerDelegate> {
    id<UIGestureRecognizerDelegate> _delegate;
}

@end

@implementation TTABaseViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 给控制器添加返回手势
    if (self.navigationController.viewControllers.count > 1) {
        // 记录系统返回手势的代理
        _delegate = self.navigationController.interactivePopGestureRecognizer.delegate;
        // 设置系统返回手势的代理为当前控制器
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    // 设置系统返回手势的代理为我们刚进入控制器的时候记录的系统的返回手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = _delegate;

}

#pragma mark - UI
/** 设置 UI */
- (void)setupUI {
    self.view.backgroundColor = kWHITE_COLOR;
    [self reconfigureLeftItem];
}

- (void)reconfigureLeftItem {
    // do nothing
    // rewrite this mothed by user if needed
}

/** 显示没有数据页面 */
- (void)showNoDataImage {
    
}

/** 移除无数据页面 */
- (void)removeNoDataImage {
    
}

/** 需要登录 */
- (void)showShouldLoginPoint {
    
}

/** 加载视图 */
- (void)showLoadingAnimation {
    
}

/** 停止加载 */
- (void)stopLoadingAnimation {
    
}

- (void)goLogin {
    
}

/** 状态栏 */
- (void)initStatusBar {
    
}

- (void)showStatusBarWithTitle:(NSString *)title {
    
}

- (void)changeStatusBarTitle:(NSString *)title {
    
}

- (void)hiddenStatusBar {
    
}

/**  重新配置 NavigateionBar 的返回按钮,如果需要,用户重写此方法即可  */
- (void)addTapBlankToHideKeyboardGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBlankToHideKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)onTapBlankToHideKeyboard:(UITapGestureRecognizer *)ges
{
    if (ges.state == UIGestureRecognizerStateEnded)
    {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    }
}

#pragma mark - Data
/**  获取数据  */
- (void)getData {
    // do nothing here
    // subclass rewrite it
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.childViewControllers.count > 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return self.navigationController.viewControllers.count > 1;
}
@end
