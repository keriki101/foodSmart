
//
//  StorageHansler.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class IdHandler {
    var idArray: [Int] = []
    static let instance = IdHandler()
    
    func storeId(_ id: Int) -> Void{
        idArray.append(id)
    }
    func idByIndex(_ indexPath: Int) -> Int{
        return idArray[indexPath]
    }
}
