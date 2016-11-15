//
//  UIView+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 16/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TTATapBlock)(UITapGestureRecognizer *tapGesture);

@interface UIView (Common)
#pragma mark - 圆角相关
/**
 以当前view区域大小,绘制4个圆角
 
 @param radius 圆角半径
 */
- (void)tta_cornerWithCornerRadius:(CGFloat)radius;

/**
 以当前view区域大小,绘制指定圆角
 
 @param corners 指定的要绘制的圆角位置
 @param radius  圆角半径
 */
- (void)tta_cornerWithRoundingCorner:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

/**
 在指定区域内绘制4个圆角
 
 @param rect   绘制区域
 @param radius 圆角半径
 */
- (void)tta_cornerWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)radius;

/**
 在指定区域内绘制指定圆角
 
 @param rect    绘制区域
 @param corners 指定的要绘制的圆角位置
 @param radius  圆角半径
 */
- (void)tta_cornerWithRoundedRect:(CGRect)rect byRoundingCorner:(UIRectCorner)corners cornerRadius:(CGFloat)radius;

/**
 为一个 uiview 添加点击手势

 @param tapBlock 点击处理 block
 */
- (void)tta_addTapGestureWithBlock:(TTATapBlock)tapBlock;

@end
