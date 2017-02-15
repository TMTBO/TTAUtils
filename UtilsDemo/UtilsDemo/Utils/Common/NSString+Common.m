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

+ (NSString *)stringWithObject:(id)anObject {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:anObject options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

+ (id)objectWithString:(NSString *)aString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:aString options:NSJSONWritingPrettyPrinted error:&error];
    !error ?: NSLog(@"String convert to Data failed");
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    !error ?: NSLog(@"String convert to Object failed");
    return object;
}

@end
