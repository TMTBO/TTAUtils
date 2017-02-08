//
//  UILabel+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 21/12/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)

+ (instancetype)label {
    return [[UILabel alloc] init];
}

+ (instancetype)labelWithString:(NSString *)aString {
    return [[self alloc] initWithString:aString];
}

- (instancetype)initWithString:(NSString *)aString {
    return [self initWithString:aString fontSize:17];
}

+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize {
    return [[self alloc] initWithString:aString fontSize:aFontSize];
}

- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize {
    return [self initWithString:aString fontSize:aFontSize textColor:[UIColor blackColor]];
}

+ (instancetype)labelWithString:(NSString *)aString textColor:(UIColor *)aColor {
    return [[self alloc] initWithString:aString textColor:aColor];
}

- (instancetype)initWithString:(NSString *)aString textColor:(UIColor *)aColor {
    return [self initWithString:aString fontSize:17 textColor:aColor];
}

+ (instancetype)labelWithString:(NSString *)aString backgroundColor:(UIColor *)aBgolor {
    return [[self alloc] initWithString:aString backgroundColor:aBgolor];
}

- (instancetype)initWithString:(NSString *)aString backgroundColor:(UIColor *)aBgolor {
    return [self initWithString:aString fontSize:17 textColor:[UIColor blackColor] backgroundColor:aBgolor];
}

+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor {
    return [[self alloc] initWithString:aString fontSize:aFontSize textColor:aColor];
}

- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor {
    return [self initWithString:aString fontSize:aFontSize textColor:aColor backgroundColor:[UIColor clearColor]];
}

+ (instancetype)labelWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor backgroundColor:(UIColor *)aBgColor {
    return [[self alloc] initWithString:aString fontSize:aFontSize textColor:aColor backgroundColor:aBgColor];
}

- (instancetype)initWithString:(NSString *)aString fontSize:(NSInteger)aFontSize textColor:(UIColor *)aColor backgroundColor:(UIColor *)aBgColor {
    if (self = [super init]) {
        self.text = aString;
        self.font = [UIFont systemFontOfSize:aFontSize];
        self.textColor = aColor;
        self.backgroundColor = aBgColor;
    }
    return self;
}

@end
