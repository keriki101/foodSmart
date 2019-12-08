//
//  APIReqSearchRecipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-28.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class APIRequest {
    static let instance = APIRequest()

    var query: String = ""
    var url: String = ""
    var testString: String = ""

    func getReturn_recipe(completed: @escaping (Result<Response, Error>) -> Void) {
       //MARK: - Get Header Information
        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]
        //remove whitespace between words
        let word = query.replacingOccurrences(of: " ", with: "%20")
        
        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=10&query=\(word)")!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        //MARK: - Get Recipe Information
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error { completed(.failure(error));  return }
            do {
                let result = try JSONDecoder().decode(Response.self, from: data!)
                completed(.success(result))
            } catch {
                completed(.failure(error))
            }
        }
        dataTask.resume()
    }
}
