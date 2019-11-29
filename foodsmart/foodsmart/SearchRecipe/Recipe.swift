//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class recipe{
    let recipeID: String
    let recipeImage: String
    let recipeTitle: String
    let recipeTime: String

    init(recipeID: String = "", recipeImage: String = "default", recipeTitle: String = "Title", recipeTime: String = "0") {
        self.recipeID = recipeID
        self.recipeImage = recipeImage
        self.recipeTitle = recipeTitle
        self.recipeTime = recipeTime
    }
}

