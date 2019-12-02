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
    
    var recipeArray: [recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeTable.delegate = self
        recipeTable.dataSource = self
        for i in 0..<10 {
            let getRecipe = recipe(id: 0, title: "Title \(i) ", readyInMinutes: 0)
            recipeArray.append(getRecipe)
        }
        recipeTable.reloadData()       
    }
}
//MARK: - Add cell
extension RecipeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return recipeArray.count
        }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            var recipeItem = recipeArray[indexPath.row]
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
        let recipeRequest = APIRequest()
        recipeRequest.setQuery(searchBarText)
        recipeRequest.getReturn(completed: { result in
            print(result)
            //here we should add code so that the results end up in the query,
            //then we have to proceed the query and take the infotmation from it to take out everything we need.
            
        })
    }
}

