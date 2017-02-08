//
//  UILabel+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 21/12/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)

+ (UILabel *)label;
+ (instancetype)labelWithString:(NSString *)aString;
- (instancetype)initWithString:(NSString *)aString;
+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize;
- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize;
+ (instancetype)labelWithString:(NSString *)aString textColor:(UIColor *)aColor;
- (instancetype)initWithString:(NSString *)aString textColor:(UIColor *)aColor;
+ (instancetype)labelWithString:(NSString *)aString backgroundColor:(UIColor *)aBgolor;
- (instancetype)initWithString:(NSString *)aString backgroundColor:(UIColor *)aBgolor;
+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor;
- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor;
+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor backgroundColor:(UIColor *)aBgColor;
- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor backgroundColor:(UIColor *)aBgColor;


@end
