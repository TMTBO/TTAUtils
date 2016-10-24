//
//  UIView+Frame.h
//  UtilsDemo
//
//  Created by TobyoTenma on 9/15/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property CGFloat tta_x;
@property CGFloat tta_y;
@property CGFloat tta_width;
@property CGFloat tta_height;
@property CGPoint tta_origin;
@property CGSize tta_size;

/// 链式调用设置viewframe相关属性
- (UIView * (^)(CGFloat))chain_x;
- (UIView * (^)(CGFloat))chain_y;
- (UIView * (^)(CGFloat))chain_width;
- (UIView * (^)(CGFloat))chain_height;
- (UIView * (^)(CGPoint))chain_origin;
- (UIView * (^)(CGSize))chain_size;

@end
