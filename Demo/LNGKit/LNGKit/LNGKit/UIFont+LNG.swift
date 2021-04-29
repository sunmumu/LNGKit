//
//  UIFont+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/29.
//

import UIKit

public enum FontWeight:String {
    case Light = "Light"
    case Medium = "Medium"
    case Regular = "Regular"
    case Semibold = "Semibold"
    case Thin = "Thin"
    case Ultralight = "Ultralight"
}

extension UIFont {
    public class func c_font(fontString:String!) -> UIFont? {
        guard fontString.count>0 else {
            return nil
        }
        let arr = fontString.components(separatedBy: "_")
        var fontSize = 12
        var fontWeight = "Regular"
        if arr.count>0 {
            fontSize = Int(arr[0]) ?? 12
        }
        if arr.count>1 {
            var weight = arr[1]
            weight = weight.uppercased()
            switch weight {
            case "L"://light
                fontWeight = "Light"
                break;
            case "M"://medium
                fontWeight = "Medium"
                break;
            case "R"://regular
                fontWeight = "Regular"
                break;
            case "S"://semibold
                fontWeight = "Semibold"
                break;
            case "T"://thin
                fontWeight = "Thin"
                break;
            case "U"://ultralight
                fontWeight = "Ultralight"
                break;
            case "B"://ultralight
                fontWeight = "Bold"
                break;
            default:
                fontWeight = ""
            }
        }
        var fontName = "PingFangSC-"
        if arr.count>2 {
            let font = arr[2]
            switch font {
            case "ali":
                fontName = "ALIBABAFont-"
                break
            default:
                break
            }
        }
        return UIFont(name: fontName+fontWeight, size: CGFloat(fontSize))
    }
    
    public class func c_font(fontSize:CGFloat,fontWeight:FontWeight) -> UIFont! {
        return UIFont(name: "PingFangSC-"+fontWeight.rawValue, size: fontSize) ?? nil
    }
    
    public class func c_font(fontSize:CGFloat) -> UIFont! {
        return UIFont.c_font(fontSize: fontSize, fontWeight: FontWeight.Regular)
    }
}

