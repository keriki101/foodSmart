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
            if let url = URL(string: "https://spoonacular.com/recipeImages/\(recipeItem.id)-90x90.jpg"){
                if let data = try? Data(contentsOf: url){
                    cell.recipeImage.image = UIImage(data: data)
                }
            }
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
                    for index in 0..<resultYeah.results.count {
                            let id = resultYeah.results[index].id
                            let title = resultYeah.results[index].title
                            let image = resultYeah.results[index].image
                            let ready = resultYeah.results[index].readyInMinutes
                            let recipes = Recipe(id: id, image: image, title: title, readyInMinutes: ready)
                            RecipeHandler.instance.allRecipeResults.append(recipes)
                        }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                
                case .failure(let error):
                    print(error)
            }
        }
            //here we should add code so that the results end up in the query,
            //then we have to proceed the query and take the infotmation from it to take out everything we need.
            
        }
    }


