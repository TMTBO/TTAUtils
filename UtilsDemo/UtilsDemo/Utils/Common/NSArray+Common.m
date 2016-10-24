//
//  NSArray+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "NSArray+Common.h"

static const void *kEMPTY;

@implementation NSArray (Common)

-(void)setEmpty:(BOOL)empty {
    objc_setAssociatedObject(self, &kEMPTY, @(empty), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)empty{
    return objc_getAssociatedObject(self, &kEMPTY);
}

/**
 判断数组是否为空
 
 @return YES: 数组为空,NO: 数组不为空
 */
- (BOOL) isEmpty {
    if (self.count) {
        return NO;
    }
    return YES;
}

@end
