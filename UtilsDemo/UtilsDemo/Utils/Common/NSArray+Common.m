//
//  NSArray+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "NSArray+Common.h"

@implementation NSArray (Common)

/**
 判断数组是否为空
 
 @return YES: 数组为空,NO: 数组不为空
 */
- (BOOL) isEmpty {
    return self == nil || self.count == 0;
}

@end
