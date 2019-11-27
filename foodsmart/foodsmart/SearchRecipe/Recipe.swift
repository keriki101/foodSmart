//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class recipe{
    let recipeImage: String
    let recipeName: String
    let recipeTime: String

    init(recipeImage: String = "default", recipeName: String = "Title", recipeTime: String = "0") {
        self.recipeImage = recipeImage
        self.recipeName = recipeName
        self.recipeTime = recipeTime
    }
}

