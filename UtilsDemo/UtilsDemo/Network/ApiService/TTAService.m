//
//  TTAService.m
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAService.h"

@implementation TTAService

- (instancetype)init {
    if (self = [super init]) {
        if ([self conformsToProtocol:@protocol(TTAServiceProtocol)]) {
            self.child = (id<TTAServiceProtocol>)self;
        }
    }
    return self;
}

// MARK:- Getter && Setter

- (NSString *)publicKey {
    
    return self.child.isOnline ? self.child.onlinePublicKey : self.child.offlinePublicKey;
}

- (NSString *)privateKey {
    return self.child.isOnline ? self.child.onlinePrivateKey : self.child.offlinePrivateKey;
}

- (NSString *)baseUrl {
    NSString *baseUrl = self.child.isOnline ? self.child.onlineApiBaseUrl : self.child.offlineApiBaseUrl;
    return baseUrl;
}

- (NSString *)apiVersion {
    return self.child.isOnline ? self.child.onlineApiVersion : self.child.offlineApiVersion;
}

@end
