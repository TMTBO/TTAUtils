//
//  UIColor+Common.m
//  DrawImageInLayerDemo
//
//  Created by TobyoTenma on 7/26/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIColor+Common.h"

@implementation UIColor (Common)
/**
 *  将 16 进制颜色转换为 UIColor
 *
 *  @param hex 16 进制颜色
 *
 *  @return UIColor实例
 */
+ (instancetype)tta_colorWithHex:(u_int32_t)hex {
  int red = (hex & 0xFF0000) >> 16;
  int green = (hex & 0x00FF00) >> 8;
  int blue = (hex & 0x0000FF);

  return [UIColor colorWithRed:red / 255.0
                         green:green / 255.0
                          blue:blue / 255.0
                         alpha:1.0];
}

@end
