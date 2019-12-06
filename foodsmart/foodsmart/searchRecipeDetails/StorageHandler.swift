
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

    static let instance = StorageHandler()
    
    func urlByIndex(_ indexPath: Int) -> String {
        return urlArray[indexPath]
    }
    
    func storeUrl(_ url: String) -> Void {
        urlArray.append(url)
    }
}
