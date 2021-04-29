//
//  UIImage+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/29.
//

import UIKit

extension UIImage {
    
    public class func c_getImageWithColor(color: UIColor, viewSize: CGSize) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
    
    public class func c_drawImage(viewSize:CGSize, borderWidth: CGFloat, borderColor: UIColor, radius:CGFloat) -> UIImage {
        //开启上下文
        let imageW: CGFloat = viewSize.width
        let imageH: CGFloat = viewSize.height
        let imageSize = CGSize.init(width: imageW, height: imageH)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        
        //取得当前的上下文，这里得到的就是上面刚创建的图片上下文
        let context = UIGraphicsGetCurrentContext()
        
        //画边框（大圆）
        let rect = CGRect(x: 0, y: 0, width: imageW, height: imageH)
        
        context?.setStrokeColor(borderColor.cgColor)
        context?.setLineWidth(borderWidth)
        context?.addArc(center: CGPoint(x: imageW/2, y: imageH/2), radius: radius, startAngle: 0, endAngle: .pi*2
        , clockwise: true)
        context?.strokePath()
        context?.addEllipse(in: rect)
        context?.setFillColor(UIColor.red.cgColor)
        context?.fill(rect)
    
        //取图
        let circleFavicon = UIGraphicsGetImageFromCurrentImageContext()
        
        //结束上下文
        UIGraphicsEndImageContext()
        
        return circleFavicon!
    }
    
    public func c_scaled(toHeight: CGFloat, isSquare:Bool) -> UIImage? {
        let scale = toHeight / size.height
        let newWidth = isSquare ? toHeight : size.width * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: toHeight), false, 2)
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
