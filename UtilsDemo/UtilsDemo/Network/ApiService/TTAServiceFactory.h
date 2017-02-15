//
//  TTAServiceFactory.h
//  UtilsDemo
//
//  Created by TobyoTenma on 14/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAService.h"

@interface TTAServiceFactory : NSObject

+ (TTAService <TTAServiceProtocol> *)serviceWithId:(NSString *)anId;
+ (TTAService <TTAServiceProtocol> *)newServiceWithId:(NSString *)anId;

@end
