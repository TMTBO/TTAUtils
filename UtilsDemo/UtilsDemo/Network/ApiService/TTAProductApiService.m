//
//  TTAProductApiService.m
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAProductApiService.h"

NSString *const kTTAProductApiService = @"kTTAProductApiService";

@implementation TTAProductApiService

// MARK:- TTAServiceProtocol

- (BOOL)isOnline {
    return [TTAAppContext sharedInstance].isOnline;
}

- (NSString *)offlineApiBaseUrl {
    return @"http://www.baidu.com";
}
- (NSString *)onlineApiBaseUrl {
    return @"https://www.baidu.com";
}

- (NSString *)offlineApiVersion {
    return @"v1";
}
- (NSString *)onlineApiVersion {
    return @"";
}

- (NSString *)offlinePublicKey {
    return @"";
}
- (NSString *)onlinePublicKey {
    return @"";
}

- (NSString *)offlinePrivateKey {
    return @"";
}
- (NSString *)onlinePrivateKey {
    return @"";
}

@end
