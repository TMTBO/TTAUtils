//
//  TTAApiManager.m
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAApiManager.h"
#import "TTAApiProxy.h"

static NSMutableDictionary const *_serverList = nil;

@interface TTAApiManager ()


@end

@implementation TTAApiManager

+ (instancetype)sharedManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        _serverList = [[NSMutableDictionary alloc] init];
    });
    return instance;
}

@end
