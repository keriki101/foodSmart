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
    let queue = DispatchQueue(label: "myQue1", qos: .utility)
    
    
    func storeUrlAndId(_ searchBarText: String) -> Void {
        
        
        queue.async {
            let request = APIRequest.instance
            request.query = searchBarText
            request.getReturn { result in
                switch result {
                case .success(let resultYeah):
                    //fetch the result from json and put in in recipe and append to allreciperesults
                    for index in 0..<resultYeah.results.count {
                        let id = resultYeah.results[index].id
                        let title = resultYeah.results[index].title
                        let image = resultYeah.results[index].image
                        let ready = resultYeah.results[index].readyInMinutes
                        let recipes = Recipe(id: id, image: image, title: title, readyInMinutes: ready)
                        RecipeHandler.instance.allRecipeResults.append(recipes)
                        StorageHandler.instance.storeId(id)
                    }
                    print(StorageHandler.instance.idArray, "id nr 1")
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    
    
    func storeLittle() -> Void{
        
        queue.async {
            let storageURL = APIRequestDetail.instance
            for index in 0..<StorageHandler.instance.idArray.count {
                storageURL.query = StorageHandler.instance.idByIndex(index)
                storageURL.getReturn { result in
                    switch result{
                    case .success(let urlDetail):
                        
                        print("Url2")
                        
                        StorageHandler.instance.storeUrl(urlDetail.sourceUrl)
                        print("Url 3")
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            print(StorageHandler.instance.urlArray, "4")
        }
        
    }
    
}
