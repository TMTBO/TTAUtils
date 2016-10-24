//
//  NSArray+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 06/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Common)

/**
 判断数组是否为空   YES: 数组为空,NO: 数组不为空
 */
@property (nonatomic, assign, readonly, getter=isEmpty) BOOL empty;



@end
