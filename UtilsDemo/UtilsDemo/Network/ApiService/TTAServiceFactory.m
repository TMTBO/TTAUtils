//
//  TTAServiceFactory.m
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAServiceFactory.h"

#import "TTAProductApiService.h"

/** 所有服务器列表 */
static NSMutableDictionary const *serviceList;

@implementation TTAServiceFactory

+ (void)load {
    [super load];
    serviceList = [NSMutableDictionary dictionary];
}

+ (TTAService <TTAServiceProtocol> *)serviceWithId:(NSString *)anId {
    if (![serviceList objectForKey:anId]) {
        [serviceList setObject:[self newServiceWithId:anId] forKey:anId];
    }
    return [serviceList objectForKey:anId];
}

+ (TTAService <TTAServiceProtocol> *)newServiceWithId:(NSString *)anId {
    TTAService <TTAServiceProtocol> *service = nil;
    if ([anId isEqualToString:kTTAProductApiService]) {
        service = [[TTAProductApiService alloc] init];
        [serviceList setObject: service forKey:anId];
    } else {
        NSAssert(YES, @"Can NOT recognize Service Identifer : %@, Please Check it, then handle it", anId);
    }
    return service;
}

@end
