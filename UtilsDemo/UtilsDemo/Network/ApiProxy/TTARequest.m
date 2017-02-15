//
//  TTARequest.m
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTARequest.h"

static NSString *const kREQUEST_PATH_KEY = @"_RequestPath";

@interface TTARequest ()

@property (nonatomic, strong, readwrite) NSDictionary *parameters;
@property (nonatomic, copy, readwrite) NSString *path;
@property (nonatomic, assign, readwrite) TTARequestType requestType;
@property (nonatomic, strong, readwrite) TTAService *service;

@end

@implementation TTARequest

+ (instancetype)requestWithServiceId:(NSString *)serviceId apiName:(NSString *)apiName requestType:(TTARequestType)requestType {
    return [self requestWithServiceId:serviceId apiName:apiName parameters:nil requestType:requestType];
}

+ (instancetype)requestWithServiceId:(NSString *)serviceId apiName:(NSString *)apiName parameters:(NSDictionary *)params requestType:(TTARequestType)requestType {
    return [[self alloc] initWithServiceId:serviceId apiName:apiName parameters:params requestType:requestType];
}

+ (NSString *)generateRequestIdWith:(NSString *)serviceId apiName:(NSString *)apiName parameters:(NSDictionary *)params {
    NSString *path = [self generatePathWith:serviceId apiName:apiName];
    NSDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:path forKey:kREQUEST_PATH_KEY];
    return [NSString stringWithObject:dic].md5String;
}

+ (NSString *)generatePathWith:(NSString *)serviceId apiName:(NSString *)apiName {
    TTAService *service = [TTAServiceFactory serviceWithId:serviceId];
    NSString *pathString = nil;
    if (service.apiVersion.isEmpty) {
        pathString = [NSString stringWithFormat:@"%@/%@", service.baseUrl, apiName];
    } else {
        pathString = [NSString stringWithFormat:@"%@/%@/%@", service.baseUrl, service.apiVersion, apiName];
    }
    return pathString;
}

- (instancetype)initWithServiceId:(NSString *)serviceId apiName:(NSString *)apiName parameters:(NSDictionary *)params requestType:(TTARequestType)requestType {
    if (self = [super init]) {
        _path = [[self class] generatePathWith:serviceId apiName:apiName];
        _parameters = params;
        _requestType = requestType;
    }
    return self;
}

// MARK:- Getter && Setter

- (NSString *)requestId {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:self.parameters];
    [dic setObject:self.path forKey:kREQUEST_PATH_KEY];
    return [NSString stringWithObject:dic].md5String;
}

@end
