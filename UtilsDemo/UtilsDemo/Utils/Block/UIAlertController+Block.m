//
//  UIAlertController+Block.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIAlertController+Block.h"

@implementation UIAlertController (Block)
/*==================== Alert ========================*/
#pragma mark - Alert
/**
 显示一个 alert

 @param title          标题
 @param message        信息
 @param aTarget        <#aTarget description#>
 @param confirmHandler 确定按钮 block
 */
+ (void)tta_showAlertWithTitle:(NSString *)title message:(NSString *)message target:(id)aTarget confirmHandler:(TTAAlertActionBlock)confirmHandler {
    [UIAlertController tta_showAlertWithTitle:title message:message target:aTarget confirmHandler:confirmHandler completionHandler:nil];
}

/**
  显示一个 alert

 @param title             标题
 @param message           信息
 @param aTarget           <#aTarget description#>
 @param confirmHandler    确定按钮 block
 @param completionHandler 弹出后处理 block
 */
+ (void)tta_showAlertWithTitle:(NSString *)title message:(NSString *)message target:(id)aTarget confirmHandler:(TTAAlertActionBlock)confirmHandler completionHandler:(void (^)())completionHandler {
    [UIAlertController tta_showAlertWithTitle:title message:message cancelTitle:@"取消" confirmTitle:@"确定" target:aTarget confirmHandler:confirmHandler completionHandler:completionHandler];
}

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
+ (void)tta_showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle target:(id)aTarget confirmHandler:(void(^)(UIAlertAction * _Nonnull action))confirmHandler completionHandler:(void (^)())completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDestructive handler:confirmHandler];
    
    if (title) {
        NSAttributedString *attributeTitle = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : kBLACK_COLOR, NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];
        [alert setValue:attributeTitle forKey:@"attributedTitle"];
    }
    if (message) {
        NSAttributedString *attributeMessage = [[NSAttributedString alloc] initWithString:message attributes:@{NSForegroundColorAttributeName : kLIGHT_GRAY_COLOR, NSFontAttributeName : [UIFont systemFontOfSize:15]}];
        [alert setValue:attributeMessage forKey:@"attributedMessage"];
    }
    
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [aTarget presentViewController:alert animated:YES completion:completionHandler];
}

/*==================== AlertSheet ========================*/
#pragma mark - AlertSheet
+ (void)tta_showActionSheetWithTarget:(id)aTarget titles:(NSArray <NSString *>* )titles handlers:(NSArray <TTAAlertActionBlock> *)handlers {
    [UIAlertController tta_showActionSheetWithTarget:aTarget titles:titles handlers:handlers completionHandler:nil];
}

+ (void)tta_showActionSheetWithTarget:(id)aTarget titles:(NSArray <NSString *>* )titles handlers:(NSArray <TTAAlertActionBlock> *)handlers completionHandler:(void (^)())completionHandler {
    [UIAlertController tta_showActionSheetWithTitle:nil message:nil target:aTarget titles:titles handlers:handlers completionHandler:completionHandler];
}

+ (void)tta_showActionSheetWithTitle:(NSString *)title message:(NSString *)message target:(id)aTarget titles:(NSArray <NSString *>* )titles handlers:(NSArray <TTAAlertActionBlock> *)handlers completionHandler:(void (^)())completionHandler {
    [UIAlertController tta_showActionSheetWithTitle:title message:message cancelTitle:@"取消" target:aTarget titles:titles handlers:handlers completionHandler:completionHandler];
}

+ (void)tta_showActionSheetWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle target:(id)aTarget titles:(NSArray <NSString *>* )titles handlers:(NSArray <TTAAlertActionBlock> *)handlers completionHandler:(void (^)())completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (title) {
        NSAttributedString *attributeTitle = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : kBLACK_COLOR, NSFontAttributeName : [UIFont boldSystemFontOfSize:18]}];
        [alert setValue:attributeTitle forKey:@"attributedTitle"];
    }
    if (message) {
        NSAttributedString *attributeMessage = [[NSAttributedString alloc] initWithString:message attributes:@{NSForegroundColorAttributeName : kLIGHT_GRAY_COLOR, NSFontAttributeName : [UIFont systemFontOfSize:15]}];
        [alert setValue:attributeMessage forKey:@"attributedMessage"];
    }
    
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:idx > handlers.count - 1 ? nil : handlers[idx]];
        [alert addAction:action];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    
    [aTarget presentViewController:alert animated:YES completion:completionHandler];
}

@end
