
//
//  StorageHansler.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class StorageHandler {
    
    var urlArray: [String] = []
    var idArray: [Int] = []
    
    static let instance = StorageHandler()
    
    func storeUrl(_ url: String) -> Void {
        urlArray.append(url)
    }
    
    func urlByIndex(_ indexPath: Int) -> String {
        return urlArray[indexPath]
    }
    
    
    func storeId(_ id: Int) -> Void{
        idArray.append(id)
    }
    func idByIndex(_ indexPath: Int) -> Int{
        return idArray[indexPath]
    }
    
}
