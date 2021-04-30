//
//  UILabel+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/30.
//

import Foundation
import UIKit

extension UILabel {
    public func c_setPrice(price:String,font:UIFont,color:UIColor) { //价格加斜线
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        let oldPriceStr = price
        let oldPriceString: NSMutableAttributedString = NSMutableAttributedString(string: oldPriceStr, attributes: [NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font : font])
        oldPriceString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber(value: 1), range: NSMakeRange(0, oldPriceStr.count))
        attributedStrM.append(oldPriceString)
        self.attributedText = attributedStrM
    }
}

