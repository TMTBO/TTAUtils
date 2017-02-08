//
//  NSString+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 08/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

- (BOOL)isEmpty {
    return self.length == 0 || self == nil;
}

@end
