//
//  Device+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/30.
//

import Foundation
import UIKit

// MARK: - 判断 机型
let isiPhone5 = UIDevice.isiPhone5()
let isiPhone6 = UIDevice.isiPhone6()
let isiPhone6BigModel = UIDevice.isiPhone6BigMode()
let isiPhone6Plus = UIDevice.isiPhone6Plus()
let isiPhone6PlusBigMode = UIDevice.isiPhone6PlusBigMode()
let isiPhoneX = UIDevice.isiPhoneX()
let isIpad = UIDevice.isAiPad()

// MARK: - 系统类型
let kisiOS11 = UIDevice.isiOS11()
let kisiOS10 = UIDevice.isiOS10()
let kisiOS9 = UIDevice.isiOS9()
let kisiOS8 = UIDevice.isiOS8()

extension UIDevice {

    public func Version()->String{

        let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return appVersion
    }


    @objc public class func isiPhoneX() -> Bool {
        if (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)<812) {
            return false
        }
        return true
    }
    
    public class func isiPhone6PlusBigMode() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 1125, height: 2001)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone6Plus() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width:1242, height: 2208)))! {
            return true
        }
        return false
    }

    public class func isiPhone6BigMode() -> Bool{
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 320, height: 568)))! {
            return true
        }
        return false
    }

    public class func isiPhone6() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width:750, height: 1334)))! {
            return true
        }
        return false
    }
    
    public class func isiPhone5() -> Bool {
        if (UIScreen.main.currentMode?.size.equalTo(CGSize.init(width: 640, height: 1136)))! {
            return true
        }
        return false
    }
    
    public class func isiOS13() -> Bool {
        if #available(iOS 13.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS12() -> Bool {
        if #available(iOS 12.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS11() -> Bool {
        if #available(iOS 11.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS10() -> Bool {
        if #available(iOS 10.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS9() -> Bool {
        if #available(iOS 9.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isiOS8() -> Bool {
        if #available(iOS 8.0, *) {
            return true
        } else {
            return false
        }
    }
    
    public class func isAiPad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return true
        }
        return false
    }
    
    public class func modelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    public class func iphoneModelAndLocalizedModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
                return String(cString: ptr)
            }
        
        // MARK: - iPhone
        if platform == "iPhone1,1" { return "iPhone 2G (A1203)"}
        if platform == "iPhone1,2" { return "iPhone 3G (A1241/A1324)"}
        if platform == "iPhone2,1" { return "iPhone 3GS (A1303/A1325)"}
        if platform == "iPhone3,1" { return "iPhone 4 (A1332)"}
        if platform == "iPhone3,2" { return "iPhone 4 (A1332)"}
        if platform == "iPhone3,3" { return "iPhone 4 (A1349)"}
        if platform == "iPhone4,1" { return "iPhone 4S (A1387/A1431)"}
        if platform == "iPhone5,1" { return "iPhone 5 (A1428)"}
        if platform == "iPhone5,2" { return "iPhone 5 (A1429/A1442)"}
        if platform == "iPhone5,3" { return "iPhone 5C (A1456/A1532)"}
        if platform == "iPhone5,4" { return "iPhone 5C (A1507/A1516/A1526/A1529)"}
        if platform == "iPhone6,1" { return "iPhone 5S (A1453/A1533)"}
        if platform == "iPhone6,2" { return "iPhone 5S (A1457/A1518/A1528/A1530)"}
        if platform == "iPhone7,1" { return "iPhone 6 Plus (A1522/A1524/A1593)"}
        if platform == "iPhone7,2" { return "iPhone 6 (A1549/A1586/A1589)"}
        if platform == "iPhone8,1" { return "iPhone 6S (A1633/A1688/A1691/A1700)"}
        if platform == "iPhone8,2" { return "iPhone 6S Plus (A1634/A1687/A1690/A1699)"}
        if platform == "iPhone8,4" { return "iPhone SE_第1代 (A1662/A1723/A1724)"}
        if platform == "iPhone9,1" { return "iPhone 7 (A1660/A1779/A1780)"}
        if platform == "iPhone9,2" { return "iPhone 7 Plus (A1661/A1785/A1786)"}
        if platform == "iPhone9,4" { return "iPhone 7 Plus (A1784)"}
        if platform == "iPhone10,1" { return "iPhone 8 (A1863/A1906/A1907)"}
        if platform == "iPhone10,2" { return "iPhone 8 Plus (A1864/A1898/A1899)"}
        if platform == "iPhone10,3" { return "iPhone X (A1865/A1902)"}
        if platform == "iPhone10,4" { return "iPhone 8 (A1905)"}
        if platform == "iPhone10,5" { return "iPhone 8 Plus (A1897)"}
        if platform == "iPhone10,6" { return "iPhone X (A1901)"}
        if platform == "iPhone11,2" { return "iPhone XS (A1920/A2097/A2098/A2100)"}
        if platform == "iPhone11,4" { return "iPhone XS Max"}
        if platform == "iPhone11,6" { return "iPhone XS Max (A1921/A2101/A2102/A2104)"}
        if platform == "iPhone11,8" { return "iPhone XR (A1984/A2105/A2106/A2108)"}
        if platform == "iPhone12,1" { return "iPhone 11 (A2111/A2221/A2223)"}
        if platform == "iPhone12,3" { return "iPhone 11 Pro (A2160/A2215/A2217)"}
        if platform == "iPhone12,5" { return "iPhone 11 Pro Max (A2161/A2220/A2218)"}
        if platform == "iPhone12,8" { return "iPhone SE_第2代 (A2275/A2296/A2298)"}
        if platform == "iPhone13,1" { return "iPhone 12 mini (A2176)"}
        if platform == "iPhone13,2" { return "iPhone 12 (A2172)"}
        if platform == "iPhone13,3" { return "iPhone 12 Pro (A2341)"}
        if platform == "iPhone13,4" { return "iPhone 12 Pro Max (A2342)"}
        
        // MARK: - iPad
        if platform == "iPad1,1" { return "iPad 1 (A1219/A1337)"}
        if platform == "iPad2,1" { return "iPad 2 (A1395)"}
        if platform == "iPad2,2" { return "iPad 2 (A1396)"}
        if platform == "iPad2,3" { return "iPad 2 (A1397)"}
        if platform == "iPad2,4" { return "iPad 2 (A1395)"}
        if platform == "iPad2,5" { return "iPad Mini 1 (A1432)"}
        if platform == "iPad2,6" { return "iPad Mini 1 (A1454)"}
        if platform == "iPad2,7" { return "iPad Mini 1 (A1455)"}
        if platform == "iPad3,1" { return "iPad 3 (A1416)"}
        if platform == "iPad3,2" { return "iPad 3 (A1403)"}
        if platform == "iPad3,3" { return "iPad 3 (A1430)"}
        if platform == "iPad3,4" { return "iPad 4 (A1458)"}
        if platform == "iPad3,5" { return "iPad 4 (A1459)"}
        if platform == "iPad3,6" { return "iPad 4 (A1460)"}
        if platform == "iPad4,1" { return "iPad Air 1 (A1474)"}
        if platform == "iPad4,2" { return "iPad Air 1 (A1475)"}
        if platform == "iPad4,3" { return "iPad Air 1 (A1476)"}
        if platform == "iPad4,4" { return "iPad Mini 2 (A1489)"}
        if platform == "iPad4,5" { return "iPad Mini 2 (A1490)"}
        if platform == "iPad4,6" { return "iPad Mini 2 (A1491)"}
        if platform == "iPad4,7" { return "iPad Mini 3 (A1599)"}
        if platform == "iPad4,8" { return "iPad Mini 3 (A1600)"}
        if platform == "iPad4,9" { return "iPad Mini 3 (A1601)"}
        if platform == "iPad5,1" { return "iPad Mini 4 (A1538)"}
        if platform == "iPad5,2" { return "iPad Mini 4 (A1550)"}
        if platform == "iPad5,3" { return "iPad Air 2 (A1566)"}
        if platform == "iPad5,4" { return "iPad Air 2 (A1567)"}
        if platform == "iPad6,3" { return "iPad Pro 1 9.7 (A1673)"}
        if platform == "iPad6,4" { return "iPad Pro 1 9.7 (A1674/A1675)"}
        if platform == "iPad6,7" { return "iPad Pro 1 12.9 (A1584)"}
        if platform == "iPad6,8" { return "iPad Pro 1 12.9 (A1652)"}
        if platform == "iPad7,5" { return "iPad 6 (A1893)"}
        if platform == "iPad7,6" { return "iPad 6 (A1954)"}
        if platform == "iPad7,11" { return "iPad 7 (A2197)"}
        if platform == "iPad7,12" { return "iPad 7 (A2198/A2200)"}
        if platform == "iPad7,1" { return "iPad Pro 2 12.9 (A1670)"}
        if platform == "iPad7,2" { return "iPad Pro 2 12.9 (A1671/A1821)"}
        if platform == "iPad7,3" { return "iPad Pro 10.5 (A1701)"}
        if platform == "iPad7,4" { return "iPad Pro 10.5 (A1709)"}
        if platform == "iPad8,1" { return "iPad Pro 11.0 (A1980)"}
        if platform == "iPad8,2" { return "iPad Pro 11.0 (A1980)"}
        if platform == "iPad8,3" { return "iPad Pro 11.0 (A1934/A1979/A2013)"}
        if platform == "iPad8,4" { return "iPad Pro 11.0 (A1934/A1979/A2013)"}
        if platform == "iPad8,5" { return "iPad Pro 3 12.9 (A1876)"}
        if platform == "iPad8,6" { return "iPad Pro 3 12.9 (A1876)"}
        if platform == "iPad8,7" { return "iPad Pro 3 12.9 (A1895/A1983/A2014)"}
        if platform == "iPad8,8" { return "iPad Pro 3 12.9 (A1895/A1983/A2014)"}
        if platform == "iPad8,9" { return "iPad Pro 2 11.0 (A2228)"}
        if platform == "iPad8,10" { return "iPad Pro 2 11.0 (A2068/A2230/A2231)"}
        if platform == "iPad8,11" { return "iPad Pro 4 12.9 (A2229)"}
        if platform == "iPad8,12" { return "iPad Pro 4 12.9 (A2069/A2232/A2233)"}
        if platform == "iPad11,1" { return "iPad mini 5 (A2133)"}
        if platform == "iPad11,2" { return "iPad mini 5 (A2124/A2125/A2126)"}
        if platform == "iPad11,3" { return "iPad Air 3 (A2152)"}
        if platform == "iPad11,4" { return "iPad Air 3 (A2123/A2153/A2154)"}
        if platform == "iPad11,6" { return "iPad 8 (A2270)"}
        if platform == "iPad11,7" { return "iPad 8 (A2428/A2429/A2430)"}
        if platform == "iPad13,1" { return "iPad Air 4"}
        if platform == "iPad13,2" { return "iPad Air 4 (A2324/A2072)"}
        
        // MARK: - iPod touch
        if platform == "iPod1,1" { return "iPod Touch 1 (A1213)"}
        if platform == "iPod2,1" { return "iPod Touch 2 (A1288/A1319)"}
        if platform == "iPod3,1" { return "iPod Touch 3 (A1318)"}
        if platform == "iPod4,1" { return "iPod Touch 4 (A1367)"}
        if platform == "iPod5,1" { return "iPod Touch 5 (A1421/A1509)"}
        if platform == "iPod7,1" { return "iPod touch 6 (A1574)"}
        if platform == "iPod9,1" { return "iPod touch 7 (A2178)"}
        
        // MARK: - Simulator
        if platform == "i386"   { return "iPhone Simulator"}
        if platform == "x86_64" { return "iPhone Simulator"}
        
        return platform
    }
}

