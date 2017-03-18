//
//  UIView+Frame.h
//  UtilsDemo
//
//  Created by TobyoTenma on 9/15/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat tta_x;
@property (nonatomic, assign) CGFloat tta_y;
@property (nonatomic, assign) CGFloat tta_width;
@property (nonatomic, assign) CGFloat tta_height;

@property (nonatomic, assign) CGPoint tta_origin;
@property (nonatomic, assign) CGSize tta_size;

@property (nonatomic, assign) CGPoint tta_center;
@property (nonatomic, assign) CGFloat tta_centerX;
@property (nonatomic, assign) CGFloat tta_centerY;

@property (nonatomic, assign) CGRect tta_frame;
@property (nonatomic, assign) CGRect tta_bounds;

@property (nonatomic, strong) UIView *topSuperView;

- (void)tta_heightEqualToView:(__kindof UIView *)aView;
- (void)tta_widthEqualToView:(__kindof UIView *)aView;
- (void)tta_sizeEqualToView:(__kindof UIView *)aView;
- (void)tta_centerEqualToView:(__kindof UIView *)aView;
- (void)tta_centerXEqualToView:(__kindof UIView *)aView;
- (void)tta_centerYEqualToView:(__kindof UIView *)aView;

/// 链式调用设置viewframe相关属性
- (UIView * (^)(CGFloat))chain_x;
- (UIView * (^)(CGFloat))chain_y;
- (UIView * (^)(CGFloat))chain_width;
- (UIView * (^)(CGFloat))chain_height;
- (UIView * (^)(CGPoint))chain_origin;
- (UIView * (^)(CGSize))chain_size;

//- (UIView * (^)(CGFloat))chain_top;
//- (UIView * (^)(CGFloat))chain_bottom;
//- (UIView * (^)(CGFloat))chain_left;
//- (UIView * (^)(CGFloat))chain_right;

@end
