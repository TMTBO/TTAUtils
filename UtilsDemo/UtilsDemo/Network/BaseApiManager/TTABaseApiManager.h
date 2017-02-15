//
//  TTABaseApiManager.h
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAResponse.h"
#import "TTARequest.h"

@class TTABaseApiManager;

/** 在调用成功后,的 params 字典里面,用这个 key 可以取出 requestId */
static NSString *const kTTA_API_BASE_MANAGER_REQUEST_ID = @"kTTAApiBaseManagerRequestId";

/** manager 的错误类型 */
typedef NS_ENUM(NSInteger, TTAApiManagerErrorType) {
    TTAApiManagerErrorTypeDefault, // 没有产生网络请求, 默认状态
    TTAApiManagerErrorTypeSuccess, // api 请求成功,返回数据正确
    TTAApiManagerErrorTypeNoContent, // api 请求成功,但返回的数据不正确;回调数据验证返回为 NO 时,为些状态
    TTAApiManagerErrorTypeParamsError, // 参数错误,不会调用 api
    TTAApiManagerErrorTypeTimeout, // 请求超时,kRequestTimeOutTime定义了请求超时时长
    TTAApiManagerErrorTypeNoNetWork // 网络不通
};

/** api 请求结果回调 */
@protocol TTAApiManagerCompletionHandlerDelegate <NSObject>
@required
- (void)managerCallApiDidSuccess:(TTABaseApiManager *)manager;
- (void)managerCallApiDidFailed:(TTABaseApiManager *)manager;

@end

/** 重新组装 api 数据对象 */
@protocol TTAApiManagerDataReformer <NSObject>
@required
- (void)manager:(TTABaseApiManager *)manager reformData:(NSDictionary *)data;

@end

/** 验证器,用于验证 api 返回或者 调用api的参数是否正确 */
@protocol TTAApiManagerValidator <NSObject>
@required
/** 验证返回参数 */
- (BOOL)manager:(TTABaseApiManager *)manager isCorrectWithCompletionHandlerData:(NSDictionary *)data;
/** 验证请求参数 */
- (BOOL)manager:(TTABaseApiManager *)manager isCorrectWithParamsData:(NSDictionary *)data;

@end

/** api 请求参数源 */
@protocol TTAApiManagerParamSource <NSObject>
@required
- (NSDictionary *)paramsForApi:(TTABaseApiManager *)manager;

@end

/** 让 manager能获取调用 api 要用的数据 */
@protocol TTAApiManager <NSObject>
@required
- (NSString *)methodName;
- (NSString *)serviceType;
- (TTARequestType)requestType;
- (BOOL)shouldCache;

@optional
- (void)cleanData;
- (NSDictionary *)reformParams:(NSDictionary *)params;
- (NSInteger)loadDataWithParams:(NSDictionary *)params;
- (BOOL)shouldLoadFromNative;

@end

/** 拦截器,TTABaseApiManager 的子类,要符合这些 protocal */
@protocol TTAApiManagerInterceptor <NSObject>
@optional
- (BOOL)manager:(TTABaseApiManager *)manager beforePerformSuccessWithResponse:(TTAResponse *)response;
- (void)manager:(TTABaseApiManager *)manager afterPerformSuccessWithResponse:(TTAResponse *)response;

- (BOOL)manager:(TTABaseApiManager *)manager beforePerformFailWithResponse:(TTAResponse *)response;
- (void)manager:(TTABaseApiManager *)manager afterPerformFailWithResponse:(TTAResponse *)response;

- (BOOL)manager:(TTABaseApiManager *)manager shouldCallApiWithParams:(NSDictionary *)params;
- (void)manager:(TTABaseApiManager *)manager afterCallApiWithParams:(NSDictionary *)params;

@end

@interface TTABaseApiManager : NSObject

@property (nonatomic, weak) id<TTAApiManagerCompletionHandlerDelegate> delegate;
@property (nonatomic, weak) id<TTAApiManagerParamSource> paramSource;
@property (nonatomic, weak) id<TTAApiManagerValidator> validator;
@property (nonatomic, weak) NSObject<TTAApiManager> *child; // 这个属性会调用到 NSObject 的方法,所以这里用到 NSObject
@property (nonatomic, weak) id<TTAApiManagerInterceptor> interceptor;

@property (nonatomic, copy, readonly) NSString *errorMessage;
@property (nonatomic, assign) TTAApiManagerErrorType errorType;
@property (nonatomic, strong) TTAResponse *response;

@property (nonatomic, assign, readonly) BOOL isReachable;
@property (nonatomic, assign, readonly) BOOL isLoading;

- (id)fetchDataWithReformer:(id<TTAApiManagerDataReformer>)reformer;

/** 用这个方法请求数据,这个方法内部会调用 param source 来获取参数 */
- (NSInteger)loadData;

- (void)cancelAllRequests;
- (void)cancelRequestWithRequestId:(NSInteger)requestId;

/*==================== 拦截器方法,继承后,要调用一下 super ========================*/
- (BOOL)beforePerformSuccessWithResponse:(TTAResponse *)response;
- (void)afterPerformSuccessWithResponse:(TTAResponse *)response;

- (BOOL)beforePerformFailWithResponse:(TTAResponse *)response;
- (void)afterPerformFailWithResponse:(TTAResponse *)response;

- (BOOL)shouldCallAPIWithParams:(NSDictionary *)params;
- (void)afterCallAPIWithParams:(NSDictionary *)params;

/*==================== 用于继承类做重载,不要调用 super ========================*/
- (NSDictionary *)reformParams:(NSDictionary *)params;
- (void)cleanData;
- (BOOL)shouldCache;

- (void)successedOnCallingApi:(TTAResponse *)response;
- (void)failedOnCallingApi:(TTAResponse *)response errorType:(TTAApiManagerErrorType)errorType;

@end
