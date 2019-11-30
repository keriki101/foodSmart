//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class recipe {
    let recipeID: Int
    let recipeImage: String
    let recipeTitle: String
    let recipeTime: String

    init(recipeID: Int, recipeImage: String = "Default", recipeTitle: String = "Title", recipeTime: String = "0") {
        self.recipeID = recipeID
        self.recipeImage = recipeImage
        self.recipeTitle = recipeTitle
        self.recipeTime = recipeTime
    }
}

