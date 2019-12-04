//
//  APIReqSearchRecipe.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-28.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

class getRecipe {
    var result = [APIRequest]()
    
    init(result:[APIRequest]) {
        self.result = result
    }
    
}

class APIRequest {
    static let instance = APIRequest()
    var query: String = ""
    var url: String = ""
    var testString: String = ""
    
    struct BodyReturn {
        var id: Int = 0
        var title: String = ""
        var readyInMinutes: Int = 0
        var image: String = ""
    
    init(id: Int, title: String = "", readyInMinutes: Int, image: String = "" ) {
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.image = image
     }
    
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
    let resourceRequest:String = "\(query)"
    //TODO URl below to a String var to change between diffrent requests??, see what they return and decide
    let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=10&query=\(resourceRequest)")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
        //Dont know why it's yellow but it does'nt seem to matter... ?
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
                
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error!)
        } else {
            //let httpResponse = response as? HTTPURLResponse
            //print(httpResponse) //This is Header being printed
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

