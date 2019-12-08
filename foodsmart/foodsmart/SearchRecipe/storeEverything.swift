//
//  storeEverything.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-06.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import Foundation


class StoreEverything {
    static let instance = StoreEverything()
    
    func storeUrlAndId(_ searchBarText: String, completion: @escaping (Error?) -> Void) {
        let request = APIRequest.instance
        request.query = searchBarText
        
        request.getReturn { result in
            switch result {
            case .success(let resultYeah):
                for index in 0..<resultYeah.results.count {
                    let id = resultYeah.results[index].id
                    let title = resultYeah.results[index].title
                    let image = resultYeah.results[index].image
                    let ready = resultYeah.results[index].readyInMinutes
                    let recipes = Recipe(id: id, image: image, title: title, readyInMinutes: ready)
                    RecipeHandler.instance.allRecipeResults.append(recipes)
                    IdHandler.instance.storeId(id)
                }
                completion(nil)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func storeLittle(completion: @escaping (Error?) -> Void){
        let storageURL = APIRequestDetail.instance
        
        for index in 0..<IdHandler.instance.idArray.count {
            storageURL.query = IdHandler.instance.idByIndex(index)
            storageURL.getReturn { result in
                switch result{
                case .success(let urlDetail):
                    RecipeHandler.instance.allRecipeResults[index].sourceUrl = urlDetail.sourceUrl
                    completion(nil)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
