//
//  BodyReturn.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-02.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class getRecipe: Codable {
    var results: [BodyReturn] = []
}

struct BodyReturn: Codable {
    var id: Int = 0
    var title: String = ""
    var readyInMinutes: Int = 0
    var image: String = ""
    var imageUrls = [String]()
}

