//
//  TTARequestTests.m
//  UtilsDemo
//
//  Created by TobyoTenma on 15/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TTANetworkConfigurations.h"

@interface TTARequestTests : XCTestCase

@end

@implementation TTARequestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testGenerateRequestId {
    NSString *requestId = [TTARequest generateRequestIdWith:kTTAProductApiService apiName:@"login" parameters:@{@"username": @"hell0"}];
    NSLog(@"requestId : %@", requestId);
}

@end
