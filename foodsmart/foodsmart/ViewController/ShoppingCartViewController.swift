//
//  ShoppingCartViewController.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/25/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit


class ShoppingCartViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ingredientList: UITableView!
    @IBOutlet weak var addIngredientTextField: UITextField!
    
    var ingredients: [String] = ["Cheese", "Garlic", "Butter", "Rice", "Pasta"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove empty rows from start
        ingredientList.tableFooterView = UIView.init(frame: .zero)
        
    }
    
    
    @IBAction func addRow(_ sender: UIButton) {
        
        insertNewIngredientTitle()
    }
    
    //Add new ingredients
    func insertNewIngredientTitle() {
        
        ingredients.append(addIngredientTextField.text!)
        let indexPath = IndexPath(row: ingredients.count - 1, section: 0)
        
        ingredientList.beginUpdates()
        ingredientList.insertRows(at: [indexPath], with: .automatic)
        ingredientList.endUpdates()
        
        //Reset text field
        addIngredientTextField.text = ""
        view.endEditing(true)
    }
}

extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ingredient = ingredients[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell") as! IngredientCell
        cell.ingredientTitle.text = ingredient
        
        return cell
        
    }
    
    //Adding checkmark on selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ingredientList.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            ingredientList.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            ingredientList.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    // Can Remove
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // Remove ingredient
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            ingredients.remove(at: indexPath.row)
            
            ingredientList.beginUpdates()
            ingredientList.deleteRows(at: [indexPath], with: .automatic)
            ingredientList.endUpdates()
        }
    }
}
