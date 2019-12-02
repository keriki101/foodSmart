//
//  BodyReturn.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-02.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class getRecipe:Codable {
    let results: [BodyReturn] = []
    
//    init(results: [BodyReturn]) {
//        self.results = results
//    }
}

class BodyReturn: Codable {
    var id: Int = 0
    var title: String = ""
    var readyInMinutes: Int = 0
    var image: String = ""
}
