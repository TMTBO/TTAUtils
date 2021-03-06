//
//  UIView+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 16/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIView+Common.h"

static const void *kTAP_GESTURE = &kTAP_GESTURE;

@interface UIView ()

@end

@implementation UIView (Common)
#pragma mark - 圆角相关
/**
 以当前view区域大小,绘制4个圆角

 @param radius 圆角半径
 */
- (void)tta_cornerWithCornerRadius:(CGFloat)radius {
    [self tta_cornerWithRoundedRect:self.bounds cornerRadius:radius];
}

/**
 以当前view区域大小,绘制指定圆角

 @param corners 指定的要绘制的圆角位置
 @param radius  圆角半径
 */
- (void)tta_cornerWithRoundingCorner:(UIRectCorner)corners cornerRadius:(CGFloat)radius {
    [self tta_cornerWithRoundedRect:self.bounds byRoundingCorner:UIRectCornerAllCorners cornerRadius:radius];
}

/**
 在指定区域内绘制4个圆角

 @param rect   绘制区域
 @param radius 圆角半径
 */
- (void)tta_cornerWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)radius {
    [self tta_cornerWithRoundedRect:rect byRoundingCorner:UIRectCornerAllCorners cornerRadius:radius];
}

/**
 在指定区域内绘制指定圆角

 @param rect    绘制区域
 @param corners 指定的要绘制的圆角位置
 @param radius  圆角半径
 */
- (void)tta_cornerWithRoundedRect:(CGRect)rect byRoundingCorner:(UIRectCorner)corners cornerRadius:(CGFloat)radius {
    [self tta_cornerWithRoundedRect:rect byRoundingCorner:corners cornerRadii:CGSizeMake(radius, radius)];
}

- (void)tta_cornerWithRoundedRect:(CGRect)rect byRoundingCorner:(UIRectCorner)corners cornerRadii:(CGSize)radii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark - 手势相关
- (void)tta_addTapGestureWithBlock:(TTATapBlock)tapBlock {
    objc_setAssociatedObject(self, kTAP_GESTURE, tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tap {
    TTATapBlock tapBlock = objc_getAssociatedObject(self, kTAP_GESTURE);
    if (tapBlock) {
        tapBlock(tap);
    }
}

@end
