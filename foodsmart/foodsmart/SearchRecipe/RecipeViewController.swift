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
    var alert: UIAlertController!
    
    var recipeArray: [recipe] = []
    var favoritesArray: [String] = []
    var sections = ["Recipe", "Favorite"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        recipeTable.delegate = self
        recipeTable.dataSource = self
        
        for i in 0..<10 {
            let getRecipe = recipe(recipeTitle: "title \(i)")
            recipeArray.append(getRecipe)
        }
        recipeTable.reloadData()
       
    }
    
    
   
    //Swipe to the left to add/remove favorite
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        //get the specific recipe
        let recipe = self.recipeArray[indexPath.row]
        //get access to image in recipeTableView
        let cell = tableView.cellForRow(at: indexPath) as! RecipeTableViewCell

        //creates an action
        let favorite = UIContextualAction(style: .normal, title: "Favorite") { (action, view, nil) in
            if recipe.isFavorite == false {
                self.recipeArray[indexPath.row].isFavorite.toggle()
                self.showAlert(message: "Added to favorites")
                cell.favoriteImage.isHidden = false
                self.recipeTable.reloadData()
            }
        }
        favorite.backgroundColor = .red
        
        let removeFavorite = UIContextualAction(style: .normal, title: "Remove favorite") { (action, view, nil) in
            if recipe.isFavorite == true {
                self.recipeArray[indexPath.row].isFavorite.toggle()
                self.showAlert(message: "Removed from favorites")
                cell.favoriteImage.isHidden = true
                self.recipeTable.reloadData()
   
            }
        }
        removeFavorite.backgroundColor = .lightGray
        //add actions
        let config = UISwipeActionsConfiguration(actions: [favorite, removeFavorite])
        //cant swipe all the way
        config.performsFirstActionWithFullSwipe = false
        return config
        
    }
    
    //Show popup message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in alert.dismiss(animated: true, completion: nil)} )
    }


}


extension RecipeViewController {
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recipeArray.count
        } else {
            return favoritesArray.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            if indexPath.section == 0 {
                let recipeItem = recipeArray[indexPath.row]
                //if favorite show image
                if(recipeItem.isFavorite == true) {
                    cell.favoriteImage.isHidden = false
                }
                cell.recipeImage.image = UIImage(systemName: recipeItem.recipeImage)
                cell.recipeTitle.text = recipeItem.recipeTitle
                cell.recipeTime.text = recipeItem.recipeTime
            }
            if indexPath.section == 1 {
                //show favorites?
            }
            return cell
        }
        return UITableViewCell()
    }
}
