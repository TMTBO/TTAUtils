//
//  AppDelegate+AppService.h
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

/**
 APP 服务管理
 */

#import "AppDelegate.h"

@interface AppDelegate (AppService)
//- (void)registerBugly;

/**
 *  基本配置
 */
- (void)configurationLaunchUserOption;

/**
 *  友盟注册
 */
//- (void)registerUmeng;
/**
 *  Mob注册
 */

//- (void)registerMob;

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption;

/**
 *  上传用户设备信息
 */
- (void)upLoadMessageAboutUser;

/**
 *  检查黑名单用户
 */
-(void)checkBlack;
@end
