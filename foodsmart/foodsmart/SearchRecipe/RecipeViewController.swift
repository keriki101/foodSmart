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
    
    
    
    /*@IBAction func GetURL(_ sender: UIButton) {
     var superview = sender.superview
     while let view = superview, !(view is UITableViewCell) {
     superview = view.superview
     }
     guard let cell = superview as? UITableViewCell else {
     
     print("button is not contained in a table view cell")
     return
     }
     guard let indexPath = tableView.indexPath(for: cell) else {
     print("failed to get index path for cell containing button")
     return
     }
     // We've got the index path for the cell that contains the button, now do something with it.
     print("button is in row \(indexPath.row)")
     
     
     UIApplication.shared.open(URL(string: "\(urlString)")! as URL, options: [:], completionHandler: nil)
     print(urlString)
     
     
     
     }*/
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searching = false
           searchBar.text = ""
           RecipeHandler.instance.allRecipeResults.removeAll()
           StorageHandler.instance.urlArray.removeAll()
           tableView.reloadData()
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

//MARK: - SearchBarSearchButtinClicked
extension RecipeViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //if search text empty dont show anything
        if searchBar.text == "" {
            return
        }
       
       //let word = searchBar.text?.replacingOccurrences(of: " ", with: "")
        
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


