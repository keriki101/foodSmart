//
//  BodyReturn.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-02.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class getRecipe: Codable {
    var results: [BodyReturn]
    
    init(results: [BodyReturn]) {
        self.results = results
    }
}

struct BodyReturn: Codable {
    var id: Int?
    var title: String?
    var readyInMinutes: Int?
    var image: String?
    //var imageUrls = [String]()
}

