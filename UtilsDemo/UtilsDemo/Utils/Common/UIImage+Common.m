//
//  UIImage+Common.m
//  DrawImageInLayerDemo
//
//  Created by TobyoTenma on 7/26/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)
/**
 *  获取一张 1 个相素点大小的指定颜色的纯色图片
 *
 *  @param aColor 指定图片的颜色
 *
 *  @return 返回一张 1 个相素点大小的指定颜色的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor {
    return [self imageWithColor:aColor withFrame:CGRectMake (0, 0, 1, 1)];
}

/**
 *  获取一个指定颜色指定大小的纯色图片
 *
 *  @param aColor 指定颜色
 *  @param aFrame 指定图片 frame 大小
 *
 *  @return 返回一张指定 frame 的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame {
    UIGraphicsBeginImageContextWithOptions(aFrame.size, YES, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext ();
    CGContextSetFillColorWithColor (ctx, [aColor CGColor]);
    CGContextFillRect (ctx, aFrame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return image;
}

-(void)creatImageWithFrame:(CGRect)aFrame isCircleImage:(BOOL)isCircleImage finish:(void (^)(UIImage *image))finish {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(aFrame.size, YES, [UIScreen mainScreen].scale);
        if (isCircleImage) {
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:aFrame];
            [path addClip];
        }
        [self drawInRect:aFrame];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            finish(image);
        });
    });
}









@end
