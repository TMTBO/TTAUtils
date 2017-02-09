//
//  TTAHUD.h
//  UtilsDemo
//
//  Created by TobyoTenma on 08/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface TTAHUD : NSObject

+ (instancetype)sharedInstance;

/*==================== Loading ========================*/
// MARK:- Loading

- (MBProgressHUD *)loading;
- (MBProgressHUD *)loading:(NSString *)msg;
- (MBProgressHUD *)loading:(NSString *)msg inView:(UIView *)aView;
- (void)loading:(NSString *)msg delay:(CGFloat)aDelay execute:(dispatch_block_t)exec completionHandler:(dispatch_block_t)completionHandler;

/*==================== Stop Loading ========================*/
// MARK:- Stop Loading

- (void)stopLoading:(MBProgressHUD *)hud;
- (void)stopLoading:(MBProgressHUD *)hud message:(NSString *)msg;
- (void)stopLoading:(MBProgressHUD *)hud message:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler;

/*==================== Tip Message ========================*/
// MARK:- Tip Message

- (void)tipMessage:(NSString *)msg;
- (void)tipMessage:(NSString *)msg delay:(CGFloat)aDelay;
- (void)tipMessage:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler;

/*==================== Sync Loading ========================*/
// MARK:- Sync Loading

- (void)syncLoading;
- (void)syncLoading:(NSString *)msg;
- (void)syncLoading:(NSString *)msg inView:(UIView *)aView;

/*==================== Sync Stop Loading ========================*/
// MARK:- Sync Stop Loading

- (void)syncStopLoading;
- (void)syncStopLoadingMessage:(NSString *)msg;
- (void)syncStopLoadingMessage:(NSString *)msg delay:(CGFloat)aDelay completionHandler:(dispatch_block_t)completionHandler;

@end
