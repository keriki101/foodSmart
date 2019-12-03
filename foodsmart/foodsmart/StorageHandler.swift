//
//  StorageHandler.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class StorageHandler {
    private static let RECIPE_KEY = "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
    
    static func setRecipeUrl(_ url: String) {
        UserDefaults.standard.set(url, forKey: RECIPE_KEY)
    }
    
    static func getRecipeUrl() -> String? {
        return UserDefaults.standard.string(forKey: RECIPE_KEY)
    }
}
