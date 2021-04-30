//
//  UITabBar+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/30.
//

import Foundation
import UIKit

extension UITabBar {
    public func resetBadge(hidden:Bool,index:Int) {
        if let items = self.items, index < items.count {
            if hidden {
                removeBadge(index: index)
            }else {
                addBadge(index: index,itemCount: items.count)
            }
        }
    }
    
    private func addBadge(index:Int, itemCount:Int) {
        if let v = self.viewWithTag(100+index) {
            if v.superview != nil {
                return
            }
        }
        let v = UIView(frame: .zero)
        v.tag = 100+index
        v.clipsToBounds = true
        v.backgroundColor = UIColor.red
        v.layer.cornerRadius = 4
        
        let percent = (CGFloat(index)+0.58)/CGFloat(itemCount)
        let x = ceilf(Float(percent * self.frame.size.width))
        
        let y:CGFloat = UIDevice.isiPhoneX() ? 8.0 : 5.0
        v.frame = CGRect(x: CGFloat(x), y:y, width: 8, height: 8)
        
        self.addSubview(v)
        self.bringSubviewToFront(v)
    }
    
    private func removeBadge(index:Int) {
        if let v = self.viewWithTag(100+index) {
            v.removeFromSuperview()
        }
        
    }
}
