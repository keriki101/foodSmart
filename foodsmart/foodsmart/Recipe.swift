//
//  Recipe.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

//Codable to easily switch between json data to useful info via encode/decode
class Recipe: Codable{
    let id: Int = 0
    let title: String = ""
    let readyInMinutes: Int = 0
    let image: String
}
