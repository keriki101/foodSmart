//
//  RestHandler.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class Resthandler {
    
    static func getReturn(completed: (([Recipe]) -> Void)?) {
    // TODO MAJOR!
    // Expressions are not allowed at top level will occur otherwise
    // https://www.youtube.com/watch?v=tdxKIPpPDAI
    //
    //
        print("inne i funktionen iaf")

        let headers = [
            "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
            "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=pie")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        
        var listOfRecipes: [Recipe] = []
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let decoder = JSONDecoder()
            if (error != nil) {
                print(error)
                print("error från get return")
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                print("nästran innen")
                do {
                    print("KUKENEEEENENE")
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if let object = json as? [String: Any] {
                        print("inne i object json")
                        print(object)
                        for anItem in object as! [Dictionary<String, AnyObject>] {
                            let recipeTitle = anItem["title"] as! String
                            let recipeID = anItem["id"] as! Int
                            
                        }
                    }
                    
                    
                }
                catch (let error){
                    print(error)
                    print("Error i catch, Allt i ditt liv är trasigt!!!")
                }
            }
        })

        dataTask.resume()
    }

}

