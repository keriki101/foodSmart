//
//  StorageHandler.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class StorageHandler{
    var idArray: [Int] = []
    let idNumber: Int = 0
    static let instance = StorageHandler()
    init() {
        
    }
    
    func storeId(_ id: Int) -> Void {
        idArray.append(id)
    }
    func accessId(arrayLocation: Int) -> Int{
        return idArray[arrayLocation]
    }
    
    
    
    func printIdsForTest() -> Void {
        print(idArray)
        print(idArray[0])
    }
    
    
    
}

