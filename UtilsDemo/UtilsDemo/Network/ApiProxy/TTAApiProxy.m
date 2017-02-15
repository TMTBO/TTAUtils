//
//  TTAApiProxy.m
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAApiProxy.h"

@interface TTAApiProxy () {
    /** 请求 id 缓存 */
    NSMutableDictionary *_dispatchTable;
}

@end

@implementation TTAApiProxy

+ (instancetype)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self p_prepareSerializer];
        [self p_prepareDispatchTable];
    }
    return self;
}

- (void)p_prepareSerializer {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html",@"text/javascript", @"text/plain", nil];
    self.securityPolicy.allowInvalidCertificates = YES;
    self.securityPolicy.validatesDomainName = NO;
    self.requestSerializer.timeoutInterval = kRequestTimeOutTime;
}

- (void)p_prepareDispatchTable {
    _dispatchTable = [[NSMutableDictionary alloc] init];
}

- (void)cancelRequestWithRequestId:(NSString *)aRequestId {
    NSURLSessionDataTask *task = [_dispatchTable objectForKey:aRequestId];
    [task cancel];
    [_dispatchTable removeObjectForKey:aRequestId];
}

- (void)cancelRequestWithRequsetIdList:(NSArray <NSString *>*)aRequestIdList {
    [aRequestIdList enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self cancelRequestWithRequestId:obj];
    }];
}

- (void)callApiWithRequest:(TTARequest *)request completionHandler:(TTAResponseCompletionHandler)completionHandler {
    NSURLSessionDataTask *task = [_dispatchTable objectForKey:request.requestId];
    if (task) {
        return;
    }
    switch (request.requestType) {
        case TTARequestTypeGet: {
            task = [self GET:request.path parameters:request.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                NSLog(@"\n===========response===========\n%@", request.path);
                [_dispatchTable removeObjectForKey:request.requestId];
                TTAResponse *response = [TTAResponse responseWithRequest:request responseObject:responseObject];
                completionHandler ? completionHandler(response) : nil;
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"\n===========response===========\n%@:\n%@", request.path, error);
                [_dispatchTable removeObjectForKey:request.requestId];
                TTAResponse *response = [TTAResponse responseWithRequest:request error:error];
                completionHandler ? completionHandler(response) : nil;
            }];
            break;
        }
        case TTARequestTypePost: {
            task = [self POST:request.path parameters:request.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                NSLog(@"\n===========response===========\n%@", request.path);
                [_dispatchTable removeObjectForKey:request.requestId];
                TTAResponse *response = [TTAResponse responseWithRequest:request responseObject:responseObject];
                completionHandler ? completionHandler(response) : nil;
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"\n===========response===========\n%@:\n%@", request.path, error);
                [_dispatchTable removeObjectForKey:request.requestId];
                TTAResponse *response = [TTAResponse responseWithRequest:request error:error];
                completionHandler ? completionHandler(response) : nil;
            }];
            break;
        }
        default:
            break;
    }
    [_dispatchTable setObject:task forKey:request.requestId];
}

@end
