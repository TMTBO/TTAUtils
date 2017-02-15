//
//  TTAService.h
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

/**
 所有服务器模型要继承 TTAService 类,并遵循 TTAServiceProtocol
 */
#import <Foundation/Foundation.h>

@protocol TTAServiceProtocol <NSObject>
@required
@property (nonatomic, assign, readonly) BOOL isOnline;

@property (nonatomic, copy, readonly) NSString *offlineApiBaseUrl;
@property (nonatomic, copy, readonly) NSString *onlineApiBaseUrl;

@property (nonatomic, copy, readonly) NSString *offlineApiVersion;
@property (nonatomic, copy, readonly) NSString *onlineApiVersion;

@property (nonatomic, copy, readonly) NSString *offlinePublicKey;
@property (nonatomic, copy, readonly) NSString *onlinePublicKey;

@property (nonatomic, copy, readonly) NSString *offlinePrivateKey;
@property (nonatomic, copy, readonly) NSString *onlinePrivateKey;

@end

@interface TTAService : NSObject

@property (nonatomic, copy, readonly) NSString *publicKey;
@property (nonatomic, copy, readonly) NSString *privateKey;
@property (nonatomic, copy, readonly) NSString *baseUrl;
@property (nonatomic, copy, readonly) NSString *apiVersion;

@property (nonatomic, weak) id<TTAServiceProtocol> child;

@end
