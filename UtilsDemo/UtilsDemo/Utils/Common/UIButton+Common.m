//
//  UIButton+Common.m
//  UtilsDemo
//
//  Created by TobyoTenma on 23/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

- (void)setButtonLayoutType:(UIButtonLayoutType)aType padding:(CGFloat)aPadding {
    if (self.imageView.image != nil && self.titleLabel.text != nil)
    {
        
        //先还原
        self.titleEdgeInsets = UIEdgeInsetsZero;
        self.imageEdgeInsets = UIEdgeInsetsZero;
        
        CGRect imageRect = self.imageView.frame;
        CGRect titleRect = self.titleLabel.frame;
        
        CGFloat totalHeight = imageRect.size.height + aPadding + titleRect.size.height;
        CGFloat selfHeight = self.frame.size.height;
        CGFloat selfWidth = self.frame.size.width;
        
        switch (aType) {
            case UIButtonLayoutTypeDefault:
                if (aPadding != 0) {
                    self.titleEdgeInsets = UIEdgeInsetsMake(0, aPadding/2, 0, -aPadding/2);
                    self.imageEdgeInsets = UIEdgeInsetsMake(0, -aPadding/2, 0, aPadding/2);
                }
                break;
            case UIButtonLayoutTypeImageRightTitleLeft: {
                //图片在右，文字在左
                self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageRect.size.width + aPadding/2), 0, (imageRect.size.width + aPadding/2));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0, (titleRect.size.width+ aPadding/2), 0, -(titleRect.size.width+ aPadding/2));
            }
                break;
            case UIButtonLayoutTypeImageTopTitleBottom: {
                //图片在上，文字在下
                self.titleEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 + imageRect.size.height + aPadding - titleRect.origin.y), (selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) / 2, -((selfHeight - totalHeight)/2 + imageRect.size.height + aPadding - titleRect.origin.y), -(selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 - imageRect.origin.y), (selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2), -((selfHeight - totalHeight)/2 - imageRect.origin.y), -(selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
            case UIButtonLayoutTypeImageBottomTitleTop: {
                //图片在下，文字在上。
                self.titleEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 - titleRect.origin.y), (selfWidth/2 - titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2, -((selfHeight - totalHeight)/2 - titleRect.origin.y), -(selfWidth/2 - titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 + titleRect.size.height + aPadding - imageRect.origin.y), (selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2), -((selfHeight - totalHeight)/2 + titleRect.size.height + aPadding - imageRect.origin.y), -(selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
            case UIButtonLayoutTypeImageCenterTitleTop: {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleRect.origin.y - aPadding), (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2, (titleRect.origin.y - aPadding), -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0, (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2), 0, -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
            case UIButtonLayoutTypeImageCenterTitleBottom: {
                self.titleEdgeInsets = UIEdgeInsetsMake((selfHeight - aPadding - titleRect.origin.y - titleRect.size.height), (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2, -(selfHeight - aPadding - titleRect.origin.y - titleRect.size.height), -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0, (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2), 0, -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
            case UIButtonLayoutTypeImageCenterTitleTopToButton: {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleRect.origin.y + titleRect.size.height - imageRect.origin.y + aPadding), (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2, (titleRect.origin.y + titleRect.size.height - imageRect.origin.y + aPadding), -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0, (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2), 0, -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
            case UIButtonLayoutTypeImageCenterTitleBottomToButton: {
                self.titleEdgeInsets = UIEdgeInsetsMake((imageRect.origin.y + imageRect.size.height - titleRect.origin.y + aPadding), (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2, -(imageRect.origin.y + imageRect.size.height - titleRect.origin.y + aPadding), -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0, (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2), 0, -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            }
                break;
//            case ButtonImageTitleStyleRightLeft: {
//                //图片在右，文字在左，距离按钮两边边距
//                self.titleEdgeInsets = UIEdgeInsetsMake(0, -(titleRect.origin.x - aPadding), 0, (titleRect.origin.x - aPadding));
//                self.imageEdgeInsets = UIEdgeInsetsMake(0, (selfWidth - aPadding - imageRect.origin.x - imageRect.size.width), 0, -(selfWidth - aPadding - imageRect.origin.x - imageRect.size.width));
//            }
//                break;
//            case ButtonImageTitleStyleLeftRight: {
//                //图片在左，文字在右，距离按钮两边边距
//                self.titleEdgeInsets = UIEdgeInsetsMake(0, (selfWidth - aPadding - titleRect.origin.x - titleRect.size.width), 0, -(selfWidth - aPadding - titleRect.origin.x - titleRect.size.width));
//                
//                self.imageEdgeInsets = UIEdgeInsetsMake(0, -(imageRect.origin.x - aPadding), 0, (imageRect.origin.x - aPadding));
//            }
//                break;
            default:
                break;
        }
    }
}

@end
