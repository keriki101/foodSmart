//
//  RestHandler.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class Resthandler {
    
    static func getReturn(completed: @escaping(Recipe) -> Void?) {
    // TODO MAJOR!
    // Expressions are not allowed at top level will occur otherwise
    // https://www.youtube.com/watch?v=tdxKIPpPDAI
    //
    //

        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=10&query=burger")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let decoder = JSONDecoder()
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                if let data = data, let recipe = try? decoder.decode(Recipe.self, from: data) {
                    //print("\(dataString)")
                    DataHandler.instance.setRecipe(recipe)
                }
            }
        })

        dataTask.resume()
    }

}

