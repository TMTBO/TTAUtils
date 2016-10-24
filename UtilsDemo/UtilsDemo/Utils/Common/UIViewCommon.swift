//
//  UIViewCommon.swift
//  UtilsDemo
//
//  Created by TobyoTenma on 16/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 在指定区域内绘制4个圆角
    ///
    /// - parameter radius:      圆角半径
    func corner(radius: CGFloat) {
        corner(roundedRect: bounds, radius: radius)
    }
    
    /// 以当前view区域大小,绘制指定圆角
    ///
    /// - parameter corners: 指定的要绘制的圆角位置
    /// - parameter radius:      圆角半径
    func corner(corners: UIRectCorner, radius: CGFloat) {
        corner(roundedRect: bounds, corners: corners, radius: radius)
    }
    
    /// 在指定区域内绘制4个圆角
    ///
    /// - parameter roundedRect: 绘制区域
    /// - parameter radius:      圆角半径
    func corner(roundedRect: CGRect, radius: CGFloat) {
        corner(roundedRect: roundedRect, corners: .allCorners, radius: radius)
    }
    
    /// 在指定区域内绘制指定圆角
    ///
    /// - parameter roundedRect: 绘制区域
    /// - parameter corners:     指定的要绘制的圆角位置
    /// - parameter radius:      圆角半径
    func corner(roundedRect: CGRect, corners: UIRectCorner, radius: CGFloat) {
        corner(roundedRect: roundedRect, corners: corners, radii: CGSize(width: radius, height: radius))
    }
    
    func corner(roundedRect: CGRect, corners: UIRectCorner, radii: CGSize) {
        let maskPath = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: corners, cornerRadii: radii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer;
    }
}
