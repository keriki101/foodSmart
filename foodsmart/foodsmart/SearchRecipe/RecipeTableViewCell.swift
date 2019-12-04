//
//  RecipeTableViewCell.swift
//  foodsmart
//
//  Created by Erik Granlund on 2019-11-27.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit


class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    //@IBOutlet weak var favoriteImage: UIButton!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeTime: UILabel!
    
    
    override func prepareForReuse() {
        // invoke superclass implementation
        super.prepareForReuse()
           
        // reset (hide) the image
        //self.favoriteImage.isHidden = true
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareForReuse()
    
        

    }
    
        
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

    }
   
}


