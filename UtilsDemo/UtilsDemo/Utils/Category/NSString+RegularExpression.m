//
//  NSString+RegularExpression.m
//  正则表达式
//
//  Created by TobyoTenma on 6/24/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)

- (BOOL)matchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return NO;
    }
    
    return YES;
}

- (NSRange)firstRangeMatchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return NSMakeRange(0, 0);
    }
    
    return result.range;
}

- (NSString *)firstStringMatchWithPattern:(NSString *)pattern
{
    NSTextCheckingResult *result = [self privateFirstMatchesWithPattern:pattern];
    
    if (result == nil) {
        return nil;
    }
    
    return [self substringWithRange:result.range];
}

- (NSArray<NSValue *> *)matchesRangeWithPattern:(NSString *)pattern
{
    NSArray <NSTextCheckingResult *> *resultArray = [self privateMatchesWithPattern:pattern];
    
    if (resultArray.count == 0) {
        return nil;
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArray) {
        [tempArray addObject:[NSValue valueWithRange:result.range]];
    }
    
    return [tempArray copy];
}

- (NSArray<NSString *> *)matchesStringWithPattern:(NSString *)pattern
{
    NSArray <NSTextCheckingResult *> *resultArray = [self privateMatchesWithPattern:pattern];
    
    if (resultArray.count == 0) {
        return nil;
    }
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArray) {
        NSString *subString = [self substringWithRange:result.range];
        [tempArray addObject:subString];
    }
    
    return [tempArray copy];
}

#pragma mark - Private

- (NSTextCheckingResult *)privateFirstMatchesWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return nil;
    }
    
    NSTextCheckingResult *result = [expression firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return result;
}

- (NSArray <NSTextCheckingResult *> *)privateMatchesWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return nil;
    }
    
    NSArray <NSTextCheckingResult *> *resultArray = [expression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
   
//    NSLog(@"resultArray : %@", resultArray);
    
    return resultArray;
}

@end
