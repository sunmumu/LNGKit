//
//  VCMake.swift
//  LNGKit
//
//  Created by sun on 2021/4/30.
//

import Foundation
import UIKit

class VCMake {
    public class func c_getVC(className:String?,storyboardName:String?) -> UIViewController?{
        if className==nil && storyboardName == nil {
            return nil
        }
        if className == nil && (storyboardName != nil) {
            let vc = UIStoryboard(name: storyboardName ?? "", bundle: nil).instantiateInitialViewController()
            return vc
        }
        if (className != nil) && storyboardName == nil {
            if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
                let classStringName = appName + "." + (className ?? "")
                let vcClass = NSClassFromString(classStringName) as! UIViewController.Type
                let vc = vcClass.init()
                return vc
            }else {
                return nil
            }
        }
        
        let vc = UIStoryboard(name:storyboardName ?? "" , bundle: nil).instantiateViewController(withIdentifier: className ?? "")
        return vc
    }
}
