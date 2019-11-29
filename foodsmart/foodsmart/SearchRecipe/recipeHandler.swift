//
//  recipeHandler.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-29.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class recipeHandler{
    static func fetchRecipe(completion: ((Bool)-> Void)?){
        guard let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=10&query=\(APIRequest.instance.query)") else {
            completion?(false)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url) { (responseData, response, responseError) in
            let decoder = JSONDecoder()
            if let data = responseData, let result = try? decoder.decode(recipe.self, from: data) {
                if result. == "success" {
                    APIRequest.instance.setQuery(result)
                }
            }
        }
    }
}
