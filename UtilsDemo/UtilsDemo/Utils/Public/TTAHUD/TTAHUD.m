//
//  TTAHUD.m
//  UtilsDemo
//
//  Created by TobyoTenma on 08/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAHUD.h"
#import "MBProgressHUD.h"

@implementation TTAHUD

- (MBProgressHUD *)loading:(NSString *)msg inView:(UIView *)aView {
    UIView *inView = aView ? aView : [AppDelegate sharedAppDelegate].window;
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:inView];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![msg isEmpty]) {
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = msg;
        }
        [inView addSubview:hud];
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:kRequestTimeOutTime];
    });
    return hud;
}

@end
