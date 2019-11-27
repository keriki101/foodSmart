//
//  RecipeViewController.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    
    @IBOutlet weak var recipeTable: UITableView!
    
    var recipeArray: [recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTable.delegate = self as? UITableViewDelegate
        recipeTable.dataSource = self as? UITableViewDataSource
        
        for i in 0..<10{
            let getRecipe = recipe(recipeName: "title \(i)", recipeTime: "0")
            recipeArray.append(getRecipe)
        }
        
       
    }


    
    func tableView(_ tableView: UITableView, CellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            var recipeItem = recipeArray[indexPath.row]
            cell.recipeImage.image = UIImage(systemName: recipeItem.recipeImage)
            cell.recipeName.text = recipeItem.recipeName
            cell.recipeTime.text = recipeItem.recipeTime
            return cell
        }
        return UITableViewCell()
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
extension RecipeViewController{
    func tableView(_ tableView: UITableView, numberOfSection section: Int) -> Int{
        return recipeArray.count
        }
}
