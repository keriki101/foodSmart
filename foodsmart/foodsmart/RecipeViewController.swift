//
//  RecipeViewController.swift
//  foodsmart
//
//  Created by Dennis Karlsson on 2019-12-03.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = "AAA"
        Resthandler.getReturn(completed: { result in
            
           

        })
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
