//
//  Recipe.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

//Codable to easily switch between json data to useful info via encode/decode

class Recipe: Decodable{
    struct Results {
        let recipe : [String:Recipe]
        let id: Int = 0
        let title: String = ""
        let readyInMinutes: Int = 0
        let image: String
        let imageUrls: [String]
    }
   let baseUri: String
   let offset: Int
   let number: Int
   let totalResults: Int
   let processingTimeMs: Int
   let expires: Int
   let isStale: Bool
    

}

