//
//  UIImage+Common.h
//  DrawImageInLayerDemo
//
//  Created by TobyoTenma on 7/26/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

/**
 *  获取一张 1 个相素点大小的指定颜色的纯色图片
 *
 *  @param aColor 指定图片的颜色
 *
 *  @return 返回一张 1 个相素点大小的指定颜色的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;
/**
 *  获取一个指定颜色指定大小的纯色图片
 *
 *  @param aColor 指定颜色
 *  @param aFrame 指定图片 frame 大小
 *
 *  @return 返回一张指定 frame 的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
-(void)creatImageWithFrame:(CGRect)aFrame isCircleImage:(BOOL)isCircleImage finish:(void (^)(UIImage *image))finish;
@end
