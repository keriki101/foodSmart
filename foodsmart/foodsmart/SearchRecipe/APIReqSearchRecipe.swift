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
    
    func setURL(_ url: String) -> Void {
        self.url = url
    }
    
    func setQuery(_ query: String) -> Void {
        self.query = query
    }
    
 func getReturn(completed: @escaping([getRecipe]) -> Void?) {
        // TODO MAJOR!
        // Expressions are not allowed at top level will occur otherwise
        //
        
            let headers = [
                "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b"
            ]

            let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=10&query=\(query)")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let myStruct = BodyReturn()
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        myStruct.title = dataString
                        
                        do{
                            print(dataString)
                            let decoder = try JSONDecoder().decode([getRecipe].self, from: data)
                            completed(decoder)
                        }
                        catch{
                            print(error.localizedDescription)
                            completed([])
                            
                        }
                    }
                }
            })
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
