//
//  FridgeResultsViewController.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class FridgeResultsViewController: UITableViewController {
    @IBOutlet var fridgeView: UITableView!
    
    var searchRecipeByIngredient: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fridgeView.delegate = self
        fridgeView.dataSource = self
        fetchJSON()
    }
    //MARK: - API-fetching JSON-data into the Handler
    func fetchJSON() {
        let semaphore = DispatchSemaphore(value: 0)
        let request = APIRequestIngredients.instance
        request.ingredients = searchRecipeByIngredient
        request.getReturn_ingredients { res in
            switch res{
            case .success(let result):
                RecipeHandlerIngredients.instance.allRecipeResults = result
                semaphore.signal()
            case .failure(let error):
                print("Failed to fetch recipes:", error)
                semaphore.signal()
            }
        }
        _ = semaphore.wait(wallTimeout: .distantFuture)
    }
}
//MARK: - Cell creation & data output

extension FridgeResultsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeHandlerIngredients.instance.allRecipeResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeIngredientsCell") as? FridgeResultsTableViewCell {
            let recipe = RecipeHandlerIngredients.instance.allRecipeResults[indexPath.row]
            cell.RecipeTitle.text = recipe.title
            if let url = URL(string: "https://spoonacular.com/recipeImages/\(recipe.id)-90x90.jpg"){
                     if let data = try? Data(contentsOf: url){
                         cell.RecipeImage.image = UIImage(data: data)
                     }
                 }
            cell.RecipeIngCount.text = "\(recipe.usedIngredientCount)"
            return cell
        }
        return UITableViewCell()
    }
}
    
    

