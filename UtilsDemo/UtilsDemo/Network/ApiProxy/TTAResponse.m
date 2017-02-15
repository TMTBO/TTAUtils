//
//  TTAResponse.m
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAResponse.h"

@interface TTAResponse ()

@property (nonatomic, strong, readwrite) TTARequest *request;
@property (nonatomic, assign, readwrite) TTAResponseStatus status;
@property (nonatomic, copy, readwrite) NSString *code;
@property (nonatomic, copy, readwrite) NSString *msg;
@property (nonatomic, strong, readwrite) id data;

@end

@implementation TTAResponse

+ (instancetype)responseWithRequest:(TTARequest *)request responseObject:(id)responseObject {
    return [[self alloc] initWithRequest:request responseObject:responseObject];
}

+ (instancetype)responseWithRequest:(TTARequest *)request error:(NSError *)error {
    return [[self alloc] initWithError:error];
}

- (instancetype)initWithRequest:(TTARequest *)request responseObject:(id)responseObject {
    if (self = [super init]) {
        NSError *error = [self p_handleResponse:responseObject];
        self.status = [self p_responseStatusWithError:error];
        self.request = request;
        self.msg = responseObject[@"msg"];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            self.data = responseObject[@"body"];
        } else {
            self.data = responseObject;
        }
    }
    return self;
}

- (instancetype)initWithError:(NSError *)error {
    if (self = [super init]) {
        self.status = [self p_responseStatusWithError:error];
        self.msg = [NSString stringWithFormat:@"Unknow Error, please check the Api and Parameters /n %@", error];
        self.data = nil;
    }
    return self;
}




- (NSError *)p_handleResponse:(id)responseObject {
    NSError *error = nil;
    NSNumber *resultCode = responseObject[@"code"];
    switch (resultCode.integerValue) {
        case 0: // 正常
            break;
        case 1:
            error = [NSError errorWithDomain:_request.service.baseUrl code:resultCode.intValue userInfo:responseObject];
            break;
        default:
            NSAssert(YES, @"NOT defined error code : %@, if you have not get the error code, ASK the Backstage Supporter", resultCode);
            break;
    }
    return error;
}

// MARK:- Private Methods

- (TTAResponseStatus)p_responseStatusWithError:(NSError *)error {
    if (error) {
        return (error.code == NSURLErrorTimedOut) ? TTAResponseStatusErrorTimeout : TTAResponseStatusErrorNoNetwork;
    } else {
        return TTAResponseStatusSuccess;
    }
}

@end
