//
//  RecipeIngredients.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class RecipeIngredients: Codable {
    let id: Int
    let image: String
    let title: String
    let usedIngredientCount: Int

    init(id: Int, image: String = "Default", title: String = "Title", usedIngredientCount: Int) {
        self.id = id
        self.image = image
        self.title = title
        self.usedIngredientCount = usedIngredientCount
    }
}


