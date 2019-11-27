//
//  APIRequest.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-11-26.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class APIRequest {
    struct bodyReturn {
        var id: Int
        var title: String
        var readyInMinutes: Int
        var image: [String]
    }
    
    let headers = [
        "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=burger")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    func request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("\(dataString)")
            }
            
        })

}
