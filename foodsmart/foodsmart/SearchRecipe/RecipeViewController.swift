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
           searchBar.text = ""
           RecipeHandler.instance.allRecipeResults.removeAll()
           StorageHandler.instance.urlArray.removeAll()
           tableView.reloadData()
       }
    
    //Show popup message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
    }
    
}

//MARK: - Add cell
extension RecipeViewController {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return RecipeHandler.instance.allRecipeResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: "\(StorageHandler.instance.urlByIndex(indexPath.row))")! as URL, options: [:], completionHandler: nil)
        print(indexPath.row)
        print(StorageHandler.instance.urlByIndex(indexPath.row))
    }
    
    //swipe to left to add favorite
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //get the specific recipe
        let recipeAtRow = RecipeHandler.instance.allRecipeResults[indexPath.row]
        //get access to image in recipTableView
        let cell = tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
        
        //creates an action
        let favorite = UIContextualAction(style: .normal, title: "Favorite") { (action, view, nil) in
            if recipeAtRow.isFavorite == false {
                RecipeHandler.instance.allRecipeResults[indexPath.row].isFavorite.toggle()
                self.showAlert(message: "Added to favorites")
                cell.favoriteImage.isHidden = false
                self.recipeTable.reloadData()
            }
        }
        favorite.backgroundColor = .red
        //add actions
        let config = UISwipeActionsConfiguration(actions: [favorite])
        
        return config
    }
    
    //swipe right to remove from favorites
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
              //get the specific recipe
          let recipeAtRow = RecipeHandler.instance.allRecipeResults[indexPath.row]
          //get access to image in recipTableView
          let cell = tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
          
          //creates an action
          let unFavorite = UIContextualAction(style: .normal, title: "Remove favorite") { (action, view, nil) in
              if recipeAtRow.isFavorite == true {
                  RecipeHandler.instance.allRecipeResults[indexPath.row].isFavorite.toggle()
                  self.showAlert(message: "Removed from favorites")
                  cell.favoriteImage.isHidden = true
                  self.recipeTable.reloadData()
              }
          }
          unFavorite.backgroundColor = .lightGray
          //add actions
          let config = UISwipeActionsConfiguration(actions: [unFavorite])
          
          return config
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell{
            if searching{
                let recipeItem = RecipeHandler.instance.allRecipeResults[indexPath.row]
                //if favorite show image
                if recipeItem.isFavorite == true {
                    cell.favoriteImage.isHidden = false
                }
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

//MARK: - SearchBarSearchButtinClicked
extension RecipeViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //if search text empty dont show anything
        if searchBar.text == "" {
            return
        }
               
        searching = true
        guard let searchBarText = searchBar.text else {return}
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
                    
                    
                    
                    let storageURL = APIRequestDetail.instance
                    storageURL.query = id
                    storageURL.getReturn { result in
                        switch result{
                        case .success(let urlDetail):
                            self.urlString = urlDetail.sourceUrl
                            print(self.urlString)

                            StorageHandler.instance.storeUrl(self.urlString)
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
   
}


