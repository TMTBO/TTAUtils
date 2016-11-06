//
//  UILabel+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)

+ (instancetype)label
{
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)title
{
    UILabel *label = [UILabel label];
    
    label.text = title;
    return label;
}

@end
