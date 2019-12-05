//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class Recipe: Codable {
    let id: Int
    let image: String
    let title: String
    let readyInMinutes: Int
    let sourceUrl: String

    init(id: Int, image: String = "Default", title: String = "Title", readyInMinutes: Int, sourceUrl: String = "") {
        self.id = id
        self.image = image
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.sourceUrl = sourceUrl
    }
}

