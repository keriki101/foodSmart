//
//  Recipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-22.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class recipe {
    let recipeImage: String
    let recipeName: String
    let recipeInfo: String
    
    init(recipeImage: String = "Default", recipeName: String = "title", recipeInfo: String = "info") {
        self.recipeImage = recipeImage
        self.recipeName = recipeName
        self.recipeInfo = recipeInfo
    }
}
