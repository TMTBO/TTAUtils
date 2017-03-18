//
//  UIView+Frame.m
//  UtilsDemo
//
//  Created by TobyoTenma on 9/15/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

/**
 x

 @return x
 */
- (CGFloat)tta_x
{
    return self.frame.origin.x;
}
-(void)setTta_x:(CGFloat)newX
{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

/**
 y

 @return y
 */
- (CGFloat)tta_y
{
    return self.frame.origin.y;
}
- (void)setTta_y:(CGFloat)newY
{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

/**
 width

 @return width
 */
- (CGFloat)tta_width
{
    return self.frame.size.width;
}
- (void)setTta_width:(CGFloat)newWidth
{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

/**
 height

 @return height
 */
- (CGFloat)tta_height
{
    return self.frame.size.height;
}
- (void)setTta_height:(CGFloat)newHeight
{
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

/**
 origin

 @return origin
 */
- (CGPoint)tta_origin
{
    return CGPointMake(self.tta_x, self.tta_y);
}
- (void)setTta_origin:(CGPoint)origin
{
    self.tta_x = origin.x;
    self.tta_y = origin.y;
}

/**
 size

 @return size
 */
- (CGSize)tta_size
{
    return self.bounds.size;
}
- (void)setTta_size:(CGSize)newSize
{
    CGRect boundsRect = self.bounds;
    boundsRect.size.width = newSize.width;
    boundsRect.size.height = newSize.height;
    self.frame = boundsRect;
}

- (CGPoint)tta_center {
    return self.center;
}
- (void)setTta_center:(CGPoint)tta_center {
    self.center = tta_center;
}

- (CGFloat)tta_centerX {
    return self.center.x;
}
- (void)setTta_centerX:(CGFloat)tta_centerX {
    CGPoint center = self.center;
    center.x = tta_centerX;
    self.center = center;
}

- (CGFloat)tta_centerY {
    return self.center.y;
}
- (void)setTta_centerY:(CGFloat)tta_centerY {
    CGPoint center = self.center;
    center.y = tta_centerY;
    self.center = center;
}

- (CGRect)tta_bounds {
    return self.bounds;
}
- (void)setTta_bounds:(CGRect)tta_bounds {
    self.bounds = tta_bounds;
}

- (CGRect)tta_frame {
    return self.frame;
}
- (void)setTta_frame:(CGRect)tta_frame {
    self.frame = tta_frame;
}

- (void)tta_heightEqualToView:(__kindof UIView *)aView {
    self.tta_height = aView.tta_height;
}

- (void)tta_widthEqualToView:(__kindof UIView *)aView {
    self.tta_width = aView.tta_width;
}

- (void)tta_sizeEqualToView:(__kindof UIView *)aView {
    self.tta_size = aView.tta_size;
}

- (void)tta_centerEqualToView:(__kindof UIView *)aView {
    UIView *superView = aView.superview ? aView.superview : aView;
    CGPoint superCenterPoint = [superView convertPoint:aView.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:superCenterPoint toView:aView];
    self.tta_center = centerPoint;
}

- (void)tta_centerXEqualToView:(__kindof UIView *)aView {
    UIView *superView = aView.superview ? aView.superview : aView;
    CGPoint superCenterPoint = [superView convertPoint:aView.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:superCenterPoint toView:aView];
    self.tta_centerX = centerPoint.x;
}

- (void)tta_centerYEqualToView:(__kindof UIView *)aView {
    UIView *superView = aView.superview ? aView.superview : aView;
    CGPoint superCenterPoint = [superView convertPoint:aView.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:superCenterPoint toView:aView];
    self.tta_centerY = centerPoint.y;
}



- (__kindof UIView *)topSuperView {
    UIView *topView = self.superview;
    if (topView) {
        while (topView.superview) {
            topView = topView.superview;
        }
    } else {
        topView = self;
    }
    return topView;
}

- (void)setTopSuperView:(UIView *)topSuperView {
    self.topSuperView = topSuperView;
}

/*==================== Block链式 ========================*/
#pragma mark - Block链式
- (UIView * (^)(CGFloat))chain_x {
    return ^(CGFloat newX){
        CGRect frame = self.frame;
        frame.origin.x = newX;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGFloat))chain_y {
    return ^(CGFloat newY){
        CGRect frame = self.frame;
        frame.origin.y = newY;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGFloat))chain_width {
    return ^(CGFloat newWidth){
        CGRect frame = self.frame;
        frame.size.width = newWidth;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGFloat))chain_height {
    return ^(CGFloat newHeight){
        CGRect frame = self.frame;
        frame.size.height = newHeight;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGPoint))chain_origin {
    return ^(CGPoint newOrigin){
        CGRect frame = self.frame;
        frame.origin = newOrigin;
        self.frame = frame;
        return self;
    };
}

- (UIView * (^)(CGSize))chain_size {
    return ^(CGSize newSize){
        CGRect frame = self.frame;
        frame.size = newSize;
        self.frame = frame;
        return self;
    };
}




@end
