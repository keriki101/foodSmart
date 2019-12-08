//
//  FridgeResultsTableViewCell.swift
//  foodsmart
//
//  Created by Pontus Schavon on 2019-12-04.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class FridgeResultsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RecipeTitle: UILabel!
    
    @IBOutlet weak var RecipeImage: UIImageView!
    
    @IBOutlet weak var RecipeIngCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
