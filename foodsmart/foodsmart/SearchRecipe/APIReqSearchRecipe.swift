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

    var query:String = ""
    var url: String = ""
    var testString: String = ""
    
    func setQuery(_ query: String) -> Void {
        self.query = query
    }
    
    func getReturn(completed: @escaping (Result<Response, Error>) -> Void) {
        // TODO MAJOR!
        // Expressions are not allowed at top level will occur otherwise
        //

        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]

        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=2&query=\(query)")!,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

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

    //MARK: - Get Recipe Information



    
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error)
//    } else {
//        if let data = data, let dataString = String(data: data, encoding: .utf8) {
//            myStruct.title = dataString
//            do{
//                let decoder: [BodyReturn] = try JSONDecoder().decode([BodyReturn].self, from: data)
//                completed(decoder)
//            }
//            catch{
//                completed([])
//            }
//        }
//    }
//})
