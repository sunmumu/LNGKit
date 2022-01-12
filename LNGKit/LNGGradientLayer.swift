//
//  LNGGradientLayer.swift
//  HanYuanSchool
//
//  Created by sun on 2022/1/7.
//  Copyright © 2022 hanyuan. All rights reserved.
//

import UIKit

enum LNGGradientLayerDirection {
    case topToBottom
    case leftToRight
    case leftTopToRightBottom
    case leftBottomToRightTop
}

class LNGGradientLayer: CAGradientLayer {
    
    public init(layerDirection:LNGGradientLayerDirection, layerFrame:CGRect,fistColor:UIColor,secondColor:UIColor) {
        super.init()
        setupParameter(layerDirection: layerDirection, layerFrame: layerFrame, fistColor: fistColor, secondColor: secondColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupParameter(layerDirection:LNGGradientLayerDirection,layerFrame:CGRect,fistColor:UIColor,secondColor:UIColor) {
        frame = layerFrame
        
        switch layerDirection {
        case .topToBottom:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 0, y: 1)
            colors = [fistColor.cgColor, secondColor.cgColor]
            locations = [0, 1]
            break
        case .leftToRight:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 1, y: 0)
            colors = [fistColor.cgColor, secondColor.cgColor]
            locations = [0, 1]
            break
        case .leftTopToRightBottom:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 1, y: 1)
            colors = [fistColor.cgColor, secondColor.cgColor]
            locations = [0, 1]
            break
        case .leftBottomToRightTop:
            startPoint = CGPoint(x: 0, y: 1)
            endPoint = CGPoint(x: 1, y: 0)
            colors = [fistColor.cgColor, secondColor.cgColor]
            locations = [0, 1]
            break
        }
    }
    
}
