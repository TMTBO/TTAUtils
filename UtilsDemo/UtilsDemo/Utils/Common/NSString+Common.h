//
//  NSString+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 08/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

/** 判断当前字符串是否为 nil 或者 长度为 0 */
@property (nonatomic, assign, readonly, getter=isEmpty) BOOL empty;

@end
