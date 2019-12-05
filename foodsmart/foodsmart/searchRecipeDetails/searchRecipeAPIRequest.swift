//
//  searchRecipeAPIRequest.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class APIRequestDetail{
    static let instance = APIRequestDetail()

    var query: Int = 0
    var url: String = ""
    var testString: String = ""

    func getReturn(completed: @escaping (Result<Detail, Error>) -> Void) {
        // TODO MAJOR!
        // Expressions are not allowed at top level will occur otherwise
        //

        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]

        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/\(query)/information")!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error { completed(.failure(error));  return }
            do {
                let result = try JSONDecoder().decode(Detail.self, from: data!)
                completed(.success(result))
            } catch {
                completed(.failure(error))
            }
        }
        dataTask.resume()
    }
}
