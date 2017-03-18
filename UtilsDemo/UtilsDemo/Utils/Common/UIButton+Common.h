//
//  UIButton+Common.h
//  UtilsDemo
//
//  Created by TobyoTenma on 23/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 图文布局类型 */
typedef NS_ENUM(NSUInteger, UIButtonLayoutType) {
    UIButtonLayoutTypeDefault = 0, // 默认布局,图片在左,文字在右,水平居中
    UIButtonLayoutTypeImageRightTitleLeft, // 图片在右,文字在左,水平居中
    UIButtonLayoutTypeImageTopTitleBottom, // 图片在上,文字在下,垂直居中
    UIButtonLayoutTypeImageBottomTitleTop, // 图片在下,文字在上,垂直居中
    UIButtonLayoutTypeImageCenterTitleTop, // 图片水平垂直居中, 文字在图片上,距图片padding
    UIButtonLayoutTypeImageCenterTitleBottom, // 图片水平垂直居中, 文字在图片下距图片padding
    UIButtonLayoutTypeImageCenterTitleTopToButton, // 图片水平垂直居中, 文字距 button 顶部padding
    UIButtonLayoutTypeImageCenterTitleBottomToButton, // 图片水平垂直居中, 文字距 button 底部padding
};

@interface UIButton (Common)


/**
 设置按钮图片和文字不同布局

 @param aType 布局类型
 @param aPadding 间距
 */
- (void)setButtonLayoutType:(UIButtonLayoutType)aType padding:(CGFloat)aPadding;

@end
