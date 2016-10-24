//
//  UIAlertController+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 18/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Common)

/**
 提示框

 @param title         提示框标题
 @param message       信息
 @param target        <#target description#>
 @param confirmAction `确定`按钮对应的操作block
 @param cancelAction  `取消`按钮对应的操作block
 */
+ (void)tta_showAlertWithTitle:(NSString *)title message:(NSString *)message target:(id)target confirmAction:(void (^)())confirmAction cancelAction:(void (^)())cancelAction;

@end
