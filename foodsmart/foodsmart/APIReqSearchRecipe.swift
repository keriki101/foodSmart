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
    
    
    
    
    func getReturn() -> String {
    // TODO MAJOR! Change into functions and classes instead or it will not work at all
    // Expressions are not allowed at top level will occur otherwise
    // https://www.youtube.com/watch?v=tdxKIPpPDAI
    //
    //

    let headers = [
        "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "x-rapidapi-key": "e44daac5e0mshc682df24497a89fp1c4513jsn7067934f0b9b" //Don't touch key for now plz
    ]
    let resourceRequest:String = "trivia/random"
    //TODO URl below to a String var to change between diffrent requests??, see what they return and decide
    let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/\(resourceRequest)")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
        //Dont know why it's yellow but it does'nt seem to matter... ?
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
                
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse) //This is Header being printed
            //This is the body which is what we need
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("\(dataString)")
            }
        }
    })

    dataTask.resume()
        return testString
    }
    
}
