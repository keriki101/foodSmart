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
        
        
        recipeTable.reloadData()       
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


            }
            cell.recipeTitle.text = recipeItem.title
            cell.recipeTime.text = "\(recipeItem.readyInMinutes)"
