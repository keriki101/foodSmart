//
//  Recipe.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

//Codable to easily switch between json data to useful info via encode/decode

struct Root: Decodable{
    struct Recipe: Decodable{
        let recipe : [String:Recipe]
        let id: Int = 0
        let title: String = ""
        let readyInMinutes: Int = 0
        let image: String
        let imageUrls: [String]
    }
    extension Recipe:Decodable{
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let recipeData = try container.decode([String:Recipe].self, forKey: .results)
            let recipe = Array(recipeData.values)
        }
    }
    

}

