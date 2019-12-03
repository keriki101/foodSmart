//
//  APIRequest.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-11-26.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation


//TODO
//Change so that it returns a struct
//Make sure other classes can use it
//Change it so that it works on search rec and search by ingredient
//Change that URL is an input or make diffrent classes???

//To all whom it may concern: Use x.instance.getReturn etc to access functions from this class
class APIRequest {
 
 static let instance = APIRequest()

 var query: String = ""
 var url: String = ""
 var testString: String = ""
 
 
 struct BodyReturn {
     var recipeID: Int = 0
     var title: String = ""
     var readyInMinutes: Int = 0
     
 }
   
    func setURL(_ url: String) -> Void {
        self.url = url
    }
    
    func setQuery(_ query: String) -> Void {
        self.query = query
    }
    
    
    
    
     static func getReturn(completed: @escaping(BodyReturn) -> Void?) {
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
            var myStruct = BodyReturn()
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    //print(httpResponse)
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        //print("\(dataString)")
                        myStruct.title = dataString
                        completed(myStruct)
                    }
                }
            })

            dataTask.resume()
        }
        
    }
