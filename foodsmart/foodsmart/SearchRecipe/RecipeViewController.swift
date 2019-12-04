//
//  RecipeViewController.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {

    @IBOutlet var recipeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTable.delegate = self
        recipeTable.dataSource = self
        for i in 0..<10 {
            let getRecipe = recipe(id: 0, title: "Title \(i) ", readyInMinutes: 0)
        }
        recipeTable.reloadData()       
    }
}
//MARK: - Add cell
extension RecipeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return RecipeHandler.instance.allRecipeResults.count
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            let recipeItem = RecipeHandler.instance.allRecipeResults[indexPath.row]
            cell.recipeImage.image = UIImage(systemName: recipeItem.image)
            cell.recipeTitle.text = recipeItem.title
            cell.recipeTime.text = "\(recipeItem.readyInMinutes)"
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - SearchBarSearchButtinClicked
extension RecipeViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
        let request = APIRequest.instance
        request.query = searchBarText
        request.getReturn { result in
            switch result {
                case .success(let resultYeah):
                    print(resultYeah.results)
                    print("nej härifrån")
                    //RecipeHandler.instance.allRecipeResults = resultYeah.results
                
                case .failure(let error):
                    print(error)
            }
        }
            //here we should add code so that the results end up in the query,
            //then we have to proceed the query and take the infotmation from it to take out everything we need.
            
        }
    }


