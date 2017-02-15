//
//  TTARequest.h
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAServiceFactory.h"

typedef NS_ENUM(NSInteger, TTARequestType) {
    TTARequestTypeGet = 0,
    TTARequestTypePost,
};

@interface TTARequest : NSObject

@property (nonatomic, strong, readonly) NSDictionary *parameters;
@property (nonatomic, copy, readonly) NSString *path;
@property (nonatomic, assign, readonly) TTARequestType requestType;
/** 请求 id, 为参数,路径组成的字典的 hash 值 */
@property (nonatomic, copy, readonly) NSString *requestId;
/** 请求 api 所在服务器 */
@property (nonatomic, strong, readonly) TTAService *service;

/**
 生成api请求
 
 @param serviceId api 所在服务器 id,在 TTANetworkConfigurations.h 文件中有定义
 @param apiName api名
 @param requestType 请求类型
 @return  api 请求对象
 */
+ (instancetype)requestWithServiceId:(NSString *)serviceId apiName:(NSString *)apiName requestType:(TTARequestType)requestType;
+ (instancetype)requestWithServiceId:(NSString *)serviceId apiName:(NSString *)apiName parameters:(NSDictionary *)params requestType:(TTARequestType)requestType;

/** 生成 requestId */
+ (NSString *)generateRequestIdWith:(NSString *)serviceId apiName:(NSString *)apiName parameters:(NSDictionary *)params;

@end
