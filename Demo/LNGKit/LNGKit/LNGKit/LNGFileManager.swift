//
//  LNGFileManager.swift
//  LNGKit
//
//  Created by sun on 2021/6/2.
//

import WebKit
import Foundation
import UIKit

public class LNGFileManager {
    
    // MARK: - Size
    public class func c_getLibraryCacheSizeString() -> String {
        let size = LNGFileManager.c_getLibraryCacheSize()
        return LNGFileManager.c_sizeToSizeString(size: size)
    }
    
    public class func c_getLibraryCacheSize() -> Double {
        let libraryCachesPath = LNGFileManager.c_libraryCachesPath() as String
        let fileArray = FileManager.default.subpaths(atPath: libraryCachesPath)
        guard let f = fileArray else {
            return 0
        }
        var size: Double = 0
        for file in f {
            let path = libraryCachesPath + "\(file)"
            if FileManager.default.fileExists(atPath: path) {
                let floder = try! FileManager.default.attributesOfItem(atPath: path)
                for (abc, bcd) in floder {
                    if abc == FileAttributeKey.size {
                        size += (bcd as AnyObject).doubleValue
                    }
                }
            }
        }
        return size
    }
    
    public class func c_getFileSizeString(path:String) -> String {
        let size = LNGFileManager.c_getFileSize(path: path)
        let sizeString = LNGFileManager.c_sizeToSizeString(size: size)
        return sizeString
    }
    
    public class func c_getFileSize(path:String) -> Double {
        var size: Double = 0
        if FileManager.default.fileExists(atPath: path) {
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            for (abc, bcd) in floder {
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).doubleValue
                }
            }
        }
        return size
    }
    
    private class func c_sizeToSizeString(size:Double) -> (String) {
        if size >= 1024.0 * 1024.0 * 1024.0 {
            let cache = size / 1024.0 / 1024.0 / 1024.0
            return String(format: "%0.fG", cache)
        } else if size >= 1024.0 * 1024.0 {
            let cache = size / 1024.0 / 1024.0
            return String(format: "%0.fMB", cache)
        } else {
            let cache = size / 1024.0
            return String(format: "%0.fKB", cache)
        }
    }
    
    // MARK: - Clear
    public class func c_clearWebviewCache() {
        let websiteDataTypes = NSSet(array: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache])
        let date = NSDate(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes as! Set<String>, modifiedSince: date as Date, completionHandler:{ })
    }
    
    public class func c_clearLibraryCache() {
        //cache文件夹
        let libraryCachesPath = LNGFileManager.c_libraryCachesPath() as String
        //文件夹下所有文件
        let files = FileManager.default.subpaths(atPath: libraryCachesPath)
        guard let f = files else {
            return
        }
        //遍历删除
        for file in f {
            //文件名
            let path = libraryCachesPath + "\(file)"
            //存在就删除
            if FileManager.default.fileExists(atPath: path) {
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch  {
                    print("出错了！")
                }
            }
        }
        
    }
    
    // MARK: - 图片保存沙盒缓存和获取
    public class func c_getPictureFromDocuments(path:String) ->(UIImage?) {
        let picturePath = LNGFileManager.c_creatPicturePathOfLibraryCaches(path: path)
        let image = UIImage(contentsOfFile: picturePath)
        return image
    }
    
    public class func c_savePictureToDocuments(image:UIImage, path:String) {
        let pictureData = image.pngData()
        let picturePath = LNGFileManager.c_creatPicturePathOfLibraryCaches(path: path)
        if let p = pictureData as NSData? {
            p.write(toFile: picturePath, atomically: true)
        }
    }
    
    public class func c_creatPicturePathOfLibraryCaches(path:String) -> (String) {
        let picturePath = LNGFileManager.c_libraryCachesPath().appendingPathComponent("\(path).png")
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
