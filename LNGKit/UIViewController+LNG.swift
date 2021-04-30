//
//  UIViewController+LNG.swift
//  LNGKit
//
//  Created by sun on 2021/4/30.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func c_getVC(className:String? = nil,storyboardName:String? = nil) -> UIViewController?{
        let vc = VCMake.c_getVC(className: className, storyboardName: storyboardName)
        return vc
    }
    
    public func c_pushVC(_ className:AnyClass!) {
        let vcClass:UIViewController.Type = className as! UIViewController.Type
        let vc = vcClass.init(nibName: nil, bundle: nil)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public class func c_getCurrentViewController() -> UIViewController?{
        // 获取当先显示的window
        var currentWindow = UIApplication.shared.keyWindow ?? UIWindow()
        if currentWindow.windowLevel != UIWindow.Level.normal {
            let windowArr = UIApplication.shared.windows
            for window in windowArr {
                if window.windowLevel == UIWindow.Level.normal {
                    currentWindow = window
                    break
                }
            }
        }
        return UIViewController.c_getNextXController(nextController: currentWindow.rootViewController)
    }
    
    private class func c_getNextXController(nextController: UIViewController?) -> UIViewController? {
        if nextController == nil {
            return nil
        }else if nextController?.presentedViewController != nil {
            return UIViewController.c_getNextXController(nextController: nextController?.presentedViewController)
        }else if let tabbar = nextController as? UITabBarController {
            return UIViewController.c_getNextXController(nextController: tabbar.selectedViewController)
        }else if let nav = nextController as? UINavigationController {
            return UIViewController.c_getNextXController(nextController: nav.visibleViewController)
        }else if nextController?.children.count ?? 0 > 0 {
            return UIViewController.c_getNextXController(nextController: nextController?.children.last)
        }
        return nextController
    }
}
