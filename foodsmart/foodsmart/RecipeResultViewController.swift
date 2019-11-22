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

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeName: UITableViewCell!
    
    @IBOutlet weak var recipeInfo: UITableViewCell!
    
    var searchArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
