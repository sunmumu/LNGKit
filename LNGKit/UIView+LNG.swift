//
//  UIView+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/28.
//

import UIKit

extension UIView {
    
    public func lng_getViewImage() -> (UIImage) {
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage.init()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func lng_saveViewImageToPhoto() {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage.init()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image,self,nil,nil)
    }
    
}
