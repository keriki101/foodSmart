//
//  DataHandler.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class DataHandler {
    static let instance = DataHandler()
    
    private var recipe: Recipe?
    
    func getRecipeUrl() -> URL? {
        if let url = recipe?.title {
            return URL(string: url)
        } else if let url = StorageHandler.getRecipeUrl() {
            return URL(string: url)
        }
        
        return nil
    }
    
    func setRecipe(_ recipe: Recipe) {
        self.recipe = recipe
        StorageHandler.setRecipeUrl(recipe.title)
    }
}
