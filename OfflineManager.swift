//
//  OfflineManager.swift
//  ARApp
//
//  Created by Prashant on 01/05/18.
//  Copyright © 2018 Prashant. All rights reserved.
//

import UIKit

class OfflineManager: NSObject {

    static let sharedManager = OfflineManager()
    let LocalServiceCacheDownloadDir        = "LocalData"

    enum WSCacheKeys {
        case CampignList
        case CampignDetail(id:String)
        case ScreenShotList

        var value:String {
            switch self {
            case .CampignList:
              return  "CampignList"
            case .CampignDetail(let id):
                return id
            case .ScreenShotList :
                return "ScreenShotList"
            }
            
        }
    }
    
    func getBaseForCacheLocal(with fileName:String) -> String? {
        
        let filePath = FileManager.default.getDocumentPath(forItemName: self.LocalServiceCacheDownloadDir)
        if FileManager.default.directoryExists(atPath: filePath) {
            return filePath.stringByAppendingPathComponent(fileName)
        } else {
            if  FileManager.default.createDirectory(withFolderName: self.LocalServiceCacheDownloadDir) {
                return filePath.stringByAppendingPathComponent(fileName)
            }
        }
        return nil
    }
    
    
    
    //------------------------------------------------------------
    
    @discardableResult
    func cacheDataToLocal<T>(with Object:T,to key:WSCacheKeys) -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(Object, toFile: getBaseForCacheLocal(with: key.value)!)
        if success {
            print( "Local Data Cached\(String(describing: getBaseForCacheLocal(with: key.value)))")
        } else {
            print("Error")
        }
        
        return success
        
    }
    
    //------------------------------------------------------------
    
    func loadCachedDataFromLocal<T>(with key:WSCacheKeys ) -> T? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: getBaseForCacheLocal(with: key.value)!) as? T
    }
    
    
    //------------------------------------------------------------
    

    func removeAllCacheDirs () {
        do {
            try FileManager.default.removeItem(atPath: self.getBaseForCacheLocal(with: "")!)
            
        } catch {
            print("error in remove dir \(error.localizedDescription)")
        }
        
    }
    
    //--------------------------------------------------------------------------------

    
}
