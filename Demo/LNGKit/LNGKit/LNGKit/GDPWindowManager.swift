//
//  GDPWindowManager.swift
//  HanYuanSchool
//
//  Created by sun on 2021/4/25.
//  Copyright © 2021 hanyuan. All rights reserved.
//

import Foundation
import UIKit

public class GDPWindowManager {
    
    public class func screenShot () -> UIImage {
        let imageSize = UIScreen.main.bounds.size
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            for window in UIApplication.shared.windows {
                context.saveGState()
                context.translateBy(x: window.center.x, y: window.center.y)
                context.concatenate(window.transform)
                context.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x, y: -window.bounds.size.height * window.layer.anchorPoint.y)
                
                if window.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                } else {
                    window.layer.render(in: context)
                }
                context.restoreGState()
            }
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        } else {
            return UIImage()
        }
    }
    
}
