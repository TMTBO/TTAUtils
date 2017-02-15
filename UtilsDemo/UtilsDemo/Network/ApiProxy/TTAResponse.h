//
//  TTAResponse.h
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTARequest.h"

@interface TTAResponse : NSObject

/** 响应对应的讲请求 */
@property (nonatomic, strong, readonly) TTARequest *request;
@property (nonatomic, assign, readonly) TTAResponseStatus status;
@property (nonatomic, copy, readonly) NSString *code;
@property (nonatomic, copy, readonly) NSString *msg;
@property (nonatomic, strong, readonly) NSDictionary *data;

/**
 生成请求成功响应

 @param request 响应对就的请求
 @param responseObject 响应体
 @return 响应对象
 */
+ (instancetype)responseWithRequest:(TTARequest *)request responseObject:(id)responseObject ;

/**
 生成请求失败响应

 @param request 响应对应的请求
 @param error 请求失败的错误
 @return 响应对象
 */
+ (instancetype)responseWithRequest:(TTARequest *)request error:(NSError *)error;

@end
