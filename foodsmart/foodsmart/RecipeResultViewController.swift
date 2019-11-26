//
//  RecipeResultViewController.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-21.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit
import Foundation

class RecipeResultViewController: UIViewController {
    
    var recipeArray: [recipe] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeName: UITableViewCell!
    
    @IBOutlet weak var recipeInfo: UITableViewCell!
    
    
    @IBOutlet weak var recipeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTable.delegate = self
        recipeTable.dataSource = self
        
        for i in 0..<10 {
            let recipeList = recipe( recipeName: "recipe\(i)")
            recipeArray.append(recipeArray)
        }
        recipeTable.reloadData()
    }
    
    extension RecipeResultViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return workExperienceArray.count
        case 1:
            return educationExperienceArray.count
        default:
            return 0
        }
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
