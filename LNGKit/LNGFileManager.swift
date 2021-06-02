//
//  LNGFileManager.swift
//  LNGKit
//
//  Created by sun on 2021/6/2.
//

import Foundation
import UIKit

class LNGFileManager {
    
    // MARK: - 图片保存沙盒和获取
    public class func c_getPictureFromDocuments(name:String) ->(UIImage?) {
        let picturePath = LNGFileManager.c_creatPicturePathOfDocuments(name: name)
        let image = UIImage(contentsOfFile: picturePath)
        return image
    }
    
    public class func c_savePictureToDocuments(image:UIImage, name:String) {
        let pictureData = image.pngData()
        let picturePath = LNGFileManager.c_creatPicturePathOfDocuments(name: name)
        if let p = pictureData as NSData? {
            p.write(toFile: picturePath, atomically: true)
        }
    }
    
    public class func c_creatPicturePathOfDocuments(name:String) -> (String) {
        let picturePath = LNGFileManager.c_documentsPath().appendingPathComponent("\(name).png")
        return picturePath
    }
    
    // MARK: - 沙盒路径
    public class func c_tmpPath () -> (NSString) {
        let tmpPath = NSTemporaryDirectory() as NSString
        return tmpPath
    }
    
    public class func c_libraryPreferencesPath () -> (NSString) {
        let libraryPreferencesPathArray = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true)
        let libraryPreferencesPath = (libraryPreferencesPathArray.first ?? "") as NSString
        return libraryPreferencesPath
    }
    
    public class func c_libraryCachesPath () -> (NSString) {
        let libraryCachesPathArray = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        let libraryCachesPath = (libraryCachesPathArray.first ?? "") as NSString
        return libraryCachesPath
    }
    
    public class func c_libraryPath () -> (NSString) {
        let libraryPathArray = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        let libraryPath = (libraryPathArray.first ?? "") as NSString
        return libraryPath
    }
    
    public class func c_documentsPath () -> (NSString) {
        let documentPathArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentPath = (documentPathArray.first ?? "") as NSString
        return documentPath
    }
    
    public class func c_homePath () -> (NSString) {
        let homePath = NSHomeDirectory() as NSString
        return homePath
    }
    
}
