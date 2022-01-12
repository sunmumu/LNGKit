//
//  UIView+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/28.
//

import UIKit

extension UIView {
    
    public func c_getViewImage() -> (UIImage) {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage.init()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func c_saveViewImageToPhoto() {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage.init()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image,self,nil,nil)
    }
    
    public func c_setCornerRadius(cornerRadius:CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    public func c_setBorderWidth(borderWidth:CGFloat) {
        self.layer.borderWidth = borderWidth
    }
    
    public func c_setShadowRadius(radius:CGFloat) {
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func c_setShadowOffset(shadowOffset:CGSize) {
        self.layer.shadowOffset = shadowOffset
    }
    
    public func c_setShadowOpacity(shadowOpacity:Float) {
        self.layer.shadowOpacity = shadowOpacity
    }
    
    public func c_setCornerRadiusAvoidOffScreen(radius:CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: (UIRectCorner.allCorners), cornerRadii: CGSize(width: radius, height: radius))
       let shaperLayer = CAShapeLayer()
       shaperLayer.frame = self.bounds
       shaperLayer.path = path.cgPath
       self.layer.mask = shaperLayer
    }
    
    public func c_setCornerRadius(radius:CGFloat, corner:UIRectCorner) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
       let shaperLayer = CAShapeLayer()
       shaperLayer.frame = self.bounds
       shaperLayer.path = path.cgPath
       self.layer.mask = shaperLayer
    }
    
    public func c_setCornerLeftTopAndRightBottom(radius:CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: (UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue|UIRectCorner.bottomRight.rawValue)), cornerRadii: CGSize(width: radius, height: radius))
        let shaperLayer = CAShapeLayer()
        shaperLayer.frame = self.bounds
        shaperLayer.path = path.cgPath
        self.layer.mask = shaperLayer
    }
    
    public func c_setCornerLeftTopAndRightTop(radius:CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: (UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue|UIRectCorner.topRight.rawValue)), cornerRadii: CGSize(width: radius, height: radius))
        let shaperLayer = CAShapeLayer()
        shaperLayer.frame = self.bounds
        shaperLayer.path = path.cgPath
        self.layer.mask = shaperLayer
    }
    
}
