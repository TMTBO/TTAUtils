//
//  UIColor+Common.h
//  DrawImageInLayerDemo
//
//  Created by TobyoTenma on 7/26/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)
/**
 *  将 16 进制颜色转换为 UIColor
 *
 *  @param hex 16 进制颜色
 *
 *  @return UIColor实例
 */
+ (instancetype)tta_colorWithHex:(u_int32_t)hex;

    @end
