//
//  SearchRecipeViewController.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class SearchRecipeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    extention SearchRecipeViewController : UISearchBarDelegate {
        func searchBarSearch
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
