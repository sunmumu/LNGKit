//
//  LNGWeChatManager.swift
//  HanYuanSchool
//
//  Created by sun on 2022/1/7.
//  Copyright © 2022 hanyuan. All rights reserved.
//

import Foundation
import UIKit

class LNGWeChatManager {
    public class func openWeChat(completion:(_ isCanOpen:Bool)->()) {
        let url = URL.init(string: "weixin://")
        guard let newUrl = url else {
            return
        }
        let canOpen = UIApplication.shared.canOpenURL(newUrl)
        if canOpen == true {
            if #available(iOS 10, *) {
                UIApplication.shared.open(newUrl, options: [UIApplication.OpenExternalURLOptionsKey.init(rawValue: ""): ""], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(newUrl)
            }
        } else {
        }
        completion(canOpen)
    }
}
