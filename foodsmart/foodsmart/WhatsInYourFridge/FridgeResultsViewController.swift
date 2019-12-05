//
//  FridgeResultsViewController.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class FridgeResultsViewController: UITableViewController {


    //@IBOutlet var frideView: UITableView!
    @IBOutlet var fridgeView: UITableView!
    
    var searchRecipeByIngredient: String = ""

    //@IBAction func resultButton(_ sender: UIButton) {
        
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fridgeView.delegate = self
        fridgeView.dataSource = self
        
        let request = APIRequestIngredients.instance
        request.ingredients = searchRecipeByIngredient
        
        request.getReturn1{ res in
            switch res{
            case .success(let result):
                RecipeHandlerIngredients.instance.allRecipeResults = result
                print(RecipeHandlerIngredients.instance.allRecipeResults)
                /*let req = RecipeHandlerIngredients.instance
                print(req.allRecipeResults)
                */
                /*result.forEach({ (results) in
                    print(results.id)
                    print("hej")
                })*/
            case .failure(let error):
                print("Failed to fetch recipes:", error)
            }
            
            

        }
        
        
        // Do any additional setup after loading the view.
    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FridgeResultsViewController {
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeHandlerIngredients.instance.allRecipeResults.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeIngredientsCell") as? FridgeResultsTableViewCell {
            let recipe = RecipeHandlerIngredients.instance.allRecipeResults[indexPath.row]
            cell.RecipeTitle.text = recipe.title
            if let url = URL(string: "https://spoonacular.com/recipeImages/\(recipe.image)-90x90.jpg"){
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
    
    

