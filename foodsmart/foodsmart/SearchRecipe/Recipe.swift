//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class Recipe: Codable {
    var id: Int
    var image: String
    var title: String
    var readyInMinutes: Int
    var sourceUrl: String
    var isFavorite: Bool

    init(id: Int, image: String = "Default", title: String = "Title", readyInMinutes: Int, sourceUrl: String = "", isFavorite: Bool = false ) {
        self.id = id
        self.image = image
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.sourceUrl = sourceUrl
        self.isFavorite = isFavorite
    }
}

