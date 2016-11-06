//
//  UIAlertController+Block.h
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ _Nonnull TTAAlertActionBlock)(UIAlertAction * _Nonnull action);

@interface UIAlertController (Block)
/*==================== Alert ========================*/
#pragma mark - Alert
/**
 显示一个 alert
 
 @param title          标题
 @param message        信息
 @param aTarget        <#aTarget description#>
 @param confirmHandler 确定按钮 block
 */
+ (void)tta_showAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message target:(id _Nonnull)aTarget confirmHandler:(TTAAlertActionBlock)confirmHandler;
/**
 显示一个 alert
 
 @param title             标题
 @param message           信息
 @param aTarget           <#aTarget description#>
 @param confirmHandler    确定按钮 block
 @param completionHandler 弹出后处理 block
 */
+ (void)tta_showAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message target:(id _Nonnull)aTarget confirmHandler:(TTAAlertActionBlock)confirmHandler completionHandler:(void (^_Nullable)())completionHandler;
/**
 显示一个 alert
 
 @param title             标题
 @param message           信息
 @param cancelTitle       取消按钮标题
 @param confirmTitle      确定按钮标题
 @param aTarget           <#aTarget description#>
 @param confirmHandler    确定按钮回调 block
 @param completionHandler 弹出后处理 block
 */
+ (void)tta_showAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message cancelTitle:(NSString *_Nonnull)cancelTitle confirmTitle:(NSString *_Nonnull)confirmTitle target:(id _Nonnull)aTarget confirmHandler:(TTAAlertActionBlock)confirmHandler completionHandler:(void (^_Nullable)())completionHandler;

/*==================== AlertSheet ========================*/
#pragma mark - AlertSheet

/**
 显示一个 ActionSheet

 @param aTarget  <#aTarget description#>
 @param titles   actionSheet 标题数组
 @param handlers 对应每一个 sheet 的回调 block
 */
+ (void)tta_showActionSheetWithTarget:(id _Nonnull)aTarget titles:(NSArray <NSString *>* _Nonnull)titles handlers:(NSArray <TTAAlertActionBlock> *_Nonnull)handlers;

/**
 显示一个 ActionSheet

 @param aTarget             <#aTarget description#>
 @param titles              actionSheet 标题数组
 @param handlers            对应每一个 sheet 的回调 block
 @param completionHandler   弹出后处理 block
 */
+ (void)tta_showActionSheetWithTarget:(id _Nonnull)aTarget titles:(NSArray <NSString *>* _Nonnull)titles handlers:(NSArray <TTAAlertActionBlock> *_Nonnull)handlers completionHandler:(void (^_Nullable)())completionHandler;

/**
 显示一个 ActionSheet

 @param title             标题
 @param message           信息
 @param aTarget           <#aTarget description#>
 @param titles            actionSheet 标题数组
 @param handlers          对应每一个 sheet 的回调 block
 @param completionHandler 弹出后处理 block
 */
+ (void)tta_showActionSheetWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message target:(id _Nonnull)aTarget titles:(NSArray <NSString *>* _Nonnull)titles handlers:(NSArray <TTAAlertActionBlock> *_Nonnull)handlers completionHandler:(void (^_Nullable)())completionHandler;

/**
 显示一个 ActionSheet

 @param title             标题
 @param message           信息
 @param cancelTitle       取消按钮标题
 @param aTarget           <#aTarget description#>
 @param titles            actionSheet标题数组
 @param handlers          对应每一个 sheet 的架设 block
 @param completionHandler 弹出后处理 block
 */
+ (void)tta_showActionSheetWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message cancelTitle:(NSString *_Nullable)cancelTitle target:(id _Nonnull)aTarget titles:(NSArray <NSString *>* _Nonnull)titles handlers:(NSArray <TTAAlertActionBlock> *_Nonnull)handlers completionHandler:(void (^_Nullable)())completionHandler;
@end
