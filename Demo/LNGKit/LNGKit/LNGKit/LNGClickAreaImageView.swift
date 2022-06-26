//
//  LNGClickAreaImageView.swift
//  HanYuanSchool
//
//  Created by sun on 2022/1/13.
//  Copyright © 2022 hanyuan. All rights reserved.
//

import UIKit

class LNGClickAreaImageView: UIImageView {
    
    var clickAreaOffset: CGFloat = 0
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let viewFrame = self.frame.inset(by: UIEdgeInsets.init(top: -clickAreaOffset, left: -clickAreaOffset, bottom: -clickAreaOffset, right: -clickAreaOffset))
        if viewFrame.contains(point) {
            return self
        }
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let biggerFrame = self.bounds.inset(by: UIEdgeInsets.init(top: -clickAreaOffset, left: -clickAreaOffset, bottom: -clickAreaOffset, right: -clickAreaOffset))
        return biggerFrame.contains(point)
    }

}
