//
//  RecipeViewController.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

enum recipePressed {
    case recipeDetail
}

class RecipeViewController: UITableViewController {
    
    @IBOutlet var recipeTable: UITableView!
    
    var urlString: String = ""
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTable.delegate = self
        recipeTable.dataSource = self
        
        tableView.keyboardDismissMode = .onDrag
        
        recipeTable.reloadData()       
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        RecipeHandler.instance.allRecipeResults.removeAll()
        IdHandler.instance.idArray.removeAll()
        searchBar.text = ""
        tableView.reloadData()
    }
    
}

//MARK: - Add cell
extension RecipeViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return RecipeHandler.instance.allRecipeResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: RecipeHandler.instance.allRecipeResults[indexPath.row].sourceUrl)!)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            if searching{
                let recipeItem = RecipeHandler.instance.allRecipeResults[indexPath.row]
                if let url = URL(string: "https://spoonacular.com/recipeImages/\(recipeItem.id)-90x90.jpg"){
                    if let data = try? Data(contentsOf: url){
                        cell.recipeImage.image = UIImage(data: data)
                    }
                }
                cell.recipeTitle.text = recipeItem.title
                cell.recipeTime.text = "\(recipeItem.readyInMinutes)"
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - SearchBarSearchButtonClicked
extension RecipeViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        RecipeHandler.instance.allRecipeResults.removeAll()
        IdHandler.instance.idArray.removeAll()
        //if search text empty dont show anything
        if searchBar.text == "" {
            return
        }
        searching = true
        guard let searchBarText = searchBar.text else {return}
        
        StoreEverything.instance.storeUrlAndId(searchBarText){error in
            if let error = error{
                print("Something went fuckin wrong")
            } else {
                StoreEverything.instance.storeLittle(){error in
                    if let error = error {
                        print("Heckin wrong in nested Async funcs. this is Hell")
                    } else {
                        
                        DispatchQueue.main.async {
                            
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}


