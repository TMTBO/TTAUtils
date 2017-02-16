//
//  TTAApiProxy.h
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef void(^TTAResponseCompletionHandler)(TTAResponse *response);

@interface TTAApiProxy : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (void)callApiWithRequest:(TTARequest *)request completionHandler:(TTAResponseCompletionHandler)completionHandler;

- (void)cancelRequestWithRequestId:(NSString *)aRequestId;
- (void)cancelRequestWithRequsetIdList:(NSArray <NSString *>*)aRequestIdList;

@end
