//
//  BodyReturn.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-12-02.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation

struct Response: Codable {
    struct Result: Codable {
        let id: Int
        let title: String
        let image: String
        let readyInMinutes: Int
        }
    let results: [Result]
}


