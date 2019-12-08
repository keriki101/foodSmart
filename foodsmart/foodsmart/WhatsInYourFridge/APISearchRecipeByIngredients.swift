//
//  APISearchRecipeByIngredients.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class APIRequestIngredients {
    static let instance = APIRequestIngredients()
    var ingredients: String = ""
    var url: String = ""
    var testString: String = ""
    
    func getReturn_ingredients(completed: @escaping (Result<[ResultIngredients], Error>) -> Void) {
        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]
        //remove spaces
        let word = ingredients.replacingOccurrences(of: " ", with: "_")
        
        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=5&ranking=1&ignorePantry=false&ingredients=\(word)")!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        
        print(request)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            
            if let error = error { completed(.failure(error));  return }
            //successful
            do{
                let result = try JSONDecoder().decode([ResultIngredients].self, from: data!)
                completed(.success(result))
            }catch let jsonError{
                completed(.failure(jsonError))
            }
        }
        dataTask.resume()
    }
}
