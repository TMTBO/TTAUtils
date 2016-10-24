//
//  UIAlertController+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 18/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIAlertController+Common.h"

typedef void(^actionBlock)(NSString *actionTitle, UIAlertActionStyle style, void (^actionHandler)(UIAlertAction * _Nonnull action));

@implementation UIAlertController (Common)

+ (void)tta_showAlertWithTitle:(NSString *)title message:(NSString *)message target:(id)target confirmAction:(void (^)())confirmAction cancelAction:(void (^)())cancelAction{
    // creat
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (confirmAction) {
            confirmAction();
        }
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelAction) {
            cancelAction();
        }
    }];
    
    // config
    
    // add
    [alertController addAction:confirm];
    [alertController addAction:cancel];
    
    // show
    [target presentViewController:alertController animated:YES completion:nil];
}

@end
