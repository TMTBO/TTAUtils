//
//  TTANetworkConfigurations.h
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#ifndef TTANetworkConfigurations_h
#define TTANetworkConfigurations_h

typedef NS_ENUM(NSInteger, TTAResponseStatus) {
    TTAResponseStatusSuccess, // 成功
    TTAResponseStatusErrorTimeout, // 超时
    TTAResponseStatusErrorNoNetwork, // 网络错误
};

// MARK:- APP 上线状态在 TTANetworkConfigurations.plist 文件中配置

/*==================== services ========================*/
// MARK:- 服务器列表常量,所在常量在对应服务器模型中赋值

extern NSString *const kTTAProductApiService;


#import "TTAApiManager.h"
#import "TTARequest.h"
#import "TTAResponse.h"


#endif /* TTANetworkConfigurations_h */
