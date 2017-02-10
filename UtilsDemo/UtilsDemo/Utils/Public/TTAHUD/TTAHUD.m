//
//  TTAHUD.m
//  UtilsDemo
//
//  Created by TobyoTenma on 08/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAHUD.h"

@interface TTAHUD () {
    MBProgressHUD *_syncHUD;
}

@end

@implementation TTAHUD

+ (instancetype)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TTAHUD alloc] init];
    });
    return instance;
}

/*==================== Alert ========================*/
// MARK:- Alert : 使用 UIAlertController+Block

/*==================== Loading ========================*/
// MARK:- Loading

- (MBProgressHUD *)loading {
    return [self loading:nil];
}

- (MBProgressHUD *)loading:(NSString *)msg {
    return [self loading:msg inView:nil];
}

- (MBProgressHUD *)loading:(NSString *)msg inView:(UIView *)aView {
    MBProgressHUD *hud = [self getHUDInView:aView];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!msg.empty) {
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = msg;
        }
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:kRequestTimeOutTime];
    });
    return hud;
}

- (void)loading:(NSString *)msg delay:(CGFloat)aDelay execute:(dispatch_block_t)exec completionHandler:(dispatch_block_t)completionHandler {
    MBProgressHUD *hud = [self getHUDInView:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!msg.empty) {
            hud.mode = MBProgressHUDModeText;
            hud.label.text = msg;
        }
        [hud showAnimated:YES];
        if (exec) {
            exec();
        }
        
        [hud hideAnimated:YES afterDelay:aDelay];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(aDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (completionHandler) {
                completionHandler();
            }
        });
    });
}

- (MBProgressHUD *)getHUDInView:(UIView *)aView {
    UIView *inView = aView ? aView : [AppDelegate sharedAppDelegate].window;
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:inView];
    [inView addSubview:hud];
    return hud;
}

/*==================== Stop Loading ========================*/
// MARK:- Stop Loading

- (void)stopLoading:(MBProgressHUD *)hud {
    [self stopLoading:hud message:nil delay:0 completionHandler:nil];
}

- (void)stopLoading:(MBProgressHUD *)hud message:(NSString *)msg {
    [self stopLoading:hud message:msg delay:1.f completionHandler:nil];
}

- (void)stopLoading:(MBProgressHUD *)hud message:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler {
    if (hud && hud.superview) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!msg.empty) {
                hud.mode = MBProgressHUDModeText;
                hud.label.text = msg;
            }
            
            [hud hideAnimated:YES afterDelay:aDelay];
            _syncHUD = nil;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(aDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (completionHandler) {
                    completionHandler();
                }
            });
        });
    }
}

/*==================== Tip Message ========================*/
// MARK:- Tip Message

- (void)tipMessage:(NSString *)msg {
    [self tipMessage:msg delay:2.0f];
}

- (void)tipMessage:(NSString *)msg delay:(CGFloat)aDelay {
    [self tipMessage:msg delay:aDelay completionHandler:nil];
}

- (void)tipMessage:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler {
    if (msg.empty) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [self getHUDInView:nil];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = msg;
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:aDelay];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(aDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (completionHandler) {
                completionHandler();
            }
        });
    });
}

/*==================== Sync Loading ========================*/
// MARK:- Sync Loading

static const NSInteger kSyncHUDStartTag = 100000;

- (void)syncLoading {
    [self syncLoading:nil];
}

- (void)syncLoading:(NSString *)msg {
    [self syncLoading:msg inView:nil];
}

- (void)syncLoading:(NSString *)msg inView:(UIView *)aView {
    if (_syncHUD) {
        _syncHUD.tag++;
        if (!msg.empty) {
            _syncHUD.mode = MBProgressHUDModeText;
            _syncHUD.label.text = msg;
        } else {
            _syncHUD.mode = MBProgressHUDModeIndeterminate;
            _syncHUD.label.text = nil;
        }
        return;
    }
    _syncHUD = [self loading:msg inView:aView];
    _syncHUD.tag = kSyncHUDStartTag;
}

/*==================== Sync Stop Loading ========================*/
// MARK:- Sync Stop Loading

- (void)syncStopLoading {
    [self syncStopLoadingMessage:nil delay:0.f completionHandler:nil];
}

- (void)syncStopLoadingMessage:(NSString *)msg {
    [self syncStopLoadingMessage:msg delay:1.f completionHandler:nil];
}

- (void)syncStopLoadingMessage:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler {
    _syncHUD.tag--;
    if (_syncHUD.tag > kSyncHUDStartTag) {
        if (!msg.empty) {
            _syncHUD.mode = MBProgressHUDModeText;
            _syncHUD.label.text = msg;
        } else {
            _syncHUD.mode = MBProgressHUDModeIndeterminate;
            _syncHUD.label.text = nil;
        }
    } else {
        [self stopLoading:_syncHUD message:msg delay:aDelay completionHandler:completionHandler];
    }
}


@end
