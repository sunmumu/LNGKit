//
//  String+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/6/4.
//

import Foundation
import UIKit

public extension String {
    
    /// 去掉所有空格
    var c_removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    
    /// 去掉首尾空格
    var c_removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    
    /// 去掉首尾空格 包括后面的换行 \n
    var c_removeHeadAndTailSpacePro:String {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: whitespace)
    }
    
    /// 获取字符串高度 (传入font/限制的宽度)
    /// - Parameters:
    ///   - font: 字体和大小
    ///   - fixedWidth: 限制的宽度
    /// - Returns: 计算的字符串高度
    func c_heightWithFont(font : UIFont = UIFont.systemFont(ofSize: 17), fixedWidth : CGFloat) -> CGFloat {
        guard self.count > 0 && fixedWidth > 0 else {
            return 0
        }
        let size = CGSize.init(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context:nil)
        return rect.size.height
    }
    
    ///  获取字符串高度 (传入font/限制的宽度/行间距)
    /// - Parameters:
    ///   - font: 字体和大小
    ///   - lineSpacing: 行间距
    ///   - fixedWidth: 限制的宽度
    /// - Returns: 计算的字符串高度
    func c_heightWithFont(font : UIFont = UIFont.systemFont(ofSize: 17), lineSpacing:CGFloat,  fixedWidth : CGFloat = 4) -> CGFloat {
        guard self.count > 0 && fixedWidth > 0 else {
            return 0
        }
        let size = CGSize.init(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为4
        paraph.lineSpacing = lineSpacing
        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font,NSAttributedString.Key.paragraphStyle: paraph], context:nil)
        return rect.size.height
    }
    
    /// 获取字符串宽度(传入font/限制的高度)
    /// - Parameters:
    ///   - fontSize: 字体和大小
    ///   - height: 限制的高度
    /// - Returns: 计算的字符串宽度
    func c_widthWithFont(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    /// 去掉首尾空格 后 指定开头空格数
    /// - Parameter num: 开头空格数
    /// - Returns: String
    func c_beginSpaceNum(num: Int) -> String {
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.c_removeHeadAndTailSpacePro
    }
    
    /// string 解析成 urlString (处理 带中文解析转换, #字符不解析转换)
    /// - Returns: string
    func c_urlConvert() -> String? {
        let decodingString = self.removingPercentEncoding
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert(charactersIn: "#")
        let encodingURL = decodingString?.addingPercentEncoding(withAllowedCharacters: charSet )
        return encodingURL
    }
    
    /// urlString拼接参数
    /// - Parameter parameter: 参数数组
    /// - Returns: String
    func c_urlAppendParameter(parameter:[String:String]) -> String {
        var newUrl:String = self
        for dic in parameter {
            if newUrl.contains("?") {
                newUrl = newUrl.appending("&\(dic.key)=\(dic.value)")
            } else {
                newUrl = newUrl.appending("?\(dic.key)=\(dic.value)")
            }
        }
        return newUrl
    }
    
    /// 去掉小数点后面的0
    /// - Parameter numberString: String
    /// - Returns: String
    func c_getWithOutZeroAfterPoint(numberString:String) -> String {
        var outNumber = numberString
        var i = 1

        if numberString.contains("."){
            while i < numberString.count{
                if outNumber.hasSuffix("0") {
                    outNumber.remove(at: outNumber.index(before: outNumber.endIndex))
                    i = i + 1
                } else {
                    break
                }
            }
            if outNumber.hasSuffix("."){
                outNumber.remove(at: outNumber.index(before: outNumber.endIndex))
            }
            return outNumber
        } else {
            return numberString
        }
    }
    
    /// 从String中截取出参数
    var c_urlParameters: [String: AnyObject]? {
        // 判断是否有参数
        guard let start = self.range(of: "?") else {
            return nil
        }

        var params = [String: AnyObject]()
        // 截取参数
        
//        let index = start.startIndex.advancedBy(1)
        let index = start.upperBound
        let paramsString = String(self[index...])

        // 判断参数是单个参数还是多个参数
        if paramsString.contains("&") {
            // 多个参数，分割参数
            let urlComponents = paramsString.components(separatedBy: "&")
            // 遍历参数
            for keyValuePair in urlComponents {
                // 生成Key/Value
                let pairComponents = keyValuePair.components(separatedBy: "=")
                let key = pairComponents.first?.removingPercentEncoding
                let value = pairComponents.last?.removingPercentEncoding
                // 判断参数是否是数组
                if let key = key, let value = value {
                    // 已存在的值，生成数组
                    if let existValue = params[key] {
                        if var existValue = existValue as? [AnyObject] {
                            existValue.append(value as AnyObject)
                        } else {
                            params[key] = [existValue, value] as AnyObject
                        }
                    } else {
                        params[key] = value as AnyObject
                    }
                }
            }
        } else {
            // 单个参数
            let pairComponents = paramsString.components(separatedBy: "=")
            // 判断是否有值
            if pairComponents.count == 1 {
                return nil
            }
            let key = pairComponents.first?.removingPercentEncoding
            let value = pairComponents.last?.removingPercentEncoding
            if let key = key, let value = value {
                params[key] = value as AnyObject
            }
        }
        return params
    }
    
    /// 手机号脱敏
    /// - Returns: String
    func c_secretPhone() -> String {
        if self.count > 10 {
            let prefix = self.prefix(3)
            let subfix = self.suffix(4)
            let str = prefix + "****" + subfix
            return String(str)
        } else {
            return self
        }
    }
    
    /// urlString 创建二维码
    /// - Parameter size: size
    /// - Returns: UIImage
    func c_creatQRImage(size: CGFloat) -> UIImage? {
        let strData = self.data(using: .utf8, allowLossyConversion: false)
        // 创建一个二维码的滤镜
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        qrFilter.setValue(strData, forKey: "inputMessage")
        qrFilter.setValue(size <= 150 ? "L" : "H", forKey: "inputCorrectionLevel")
        let qrCIImage = qrFilter.outputImage
        // 创建一个颜色滤镜,黑白色
        guard let colorFilter = CIFilter(name: "CIFalseColor") else { return nil }
        colorFilter.setDefaults()
        colorFilter.setValue(qrCIImage, forKey: "inputImage")
        colorFilter.setValue(CIColor.black, forKey: "inputColor0")
        colorFilter.setValue(CIColor.white, forKey: "inputColor1")
        
        guard let outputImage = colorFilter.outputImage else { return nil }
        let scale = size / outputImage.extent.size.width
        let image_tr = outputImage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        let qrImage = UIImage(ciImage: image_tr)
        return qrImage
    }
}
