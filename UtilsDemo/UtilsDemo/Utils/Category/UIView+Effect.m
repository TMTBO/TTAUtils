//
//  UIView+Effect.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIView+Effect.h"

@implementation UIView (Effect)
- (void)tta_blurWithColor:(UIColor *)aColor{
    self.backgroundColor = aColor;
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [self addSubview:effectView];
}

- (void)tta_blurSelfBackground
{
    [self tta_blurWithColor:[[UIColor tta_colorWithHex:0xBDC3C7] colorWithAlphaComponent:0.8]];
}

@end
