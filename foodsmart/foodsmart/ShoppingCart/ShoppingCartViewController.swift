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
    @IBOutlet weak var deleteButton: UIButton!
    
    var ingredients: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveIngredient()
        updateDeleteButtonStatus()
        ingredientList.allowsMultipleSelectionDuringEditing = true
    }
    
    //MARK: - Delete, edit or reload buttons pressed
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
        if var selection = ingredientList.indexPathsForSelectedRows {
            if selection.count > 0 {
                selection.sort() { $1.compare($0) == .orderedAscending }
                
                for indexPath in selection {
                    ingredients.remove(at: indexPath.row)
                    UserDefaults.standard.set(ingredients, forKey: "saveIngredient")
                }
                ingredientList.deleteRows(at: selection, with: .automatic)
                updateDeleteButtonStatus()
            }
        }
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        ingredientList.setEditing(!ingredientList.isEditing, animated: true)
        sender.setTitle(ingredientList.isEditing ? "Done" : "Edit", for: .normal)
        updateDeleteButtonStatus()
    }
    
    @IBAction func reloadButtonPressed(_ sender: UIButton) {
        ingredientList.reloadData()
        updateDeleteButtonStatus()
    }
    
    func updateDeleteButtonStatus() {
          func setButtonTitle(title: String, enabled: Bool) {
              deleteButton.setTitle(title, for: .normal)
              deleteButton.isEnabled = enabled
          }
          let rootButtonTitle = "Delete"
          if ingredientList.isEditing != true {
              setButtonTitle(title: rootButtonTitle, enabled: false)
          } else {
              if let selection = ingredientList.indexPathsForSelectedRows {
                  if selection.count == 0 {
                      setButtonTitle(title: rootButtonTitle, enabled: false)
                  } else {
                      setButtonTitle(title: rootButtonTitle + " (\(selection.count))", enabled: true)
                  }
              } else {
                  setButtonTitle(title: rootButtonTitle, enabled: false)
              }
          }
      }
    
    @IBAction func addRow(_ sender: UIButton) {
        if addIngredientTextField.text == "" {
            return
        } else {
            insertNewIngredientTitle()
        }
    }
    
    //MARK: - Save ingredient
    //Save ingredient
    func saveIngredient() {
        let savedIngredient = UserDefaults.standard.object(forKey: "saveIngredient")
        
        if let ingredient = savedIngredient as? [String] {
            ingredients = ingredient
        }
    }
    
    //Add new ingredients
    func insertNewIngredientTitle() {
        
        ingredients.append(addIngredientTextField.text!)
        // save the new ingredient
        UserDefaults.standard.set(ingredients, forKey: "saveIngredient")
        
        let indexPath = IndexPath(row: ingredients.count - 1, section: 0)
        
        ingredientList.beginUpdates()
        ingredientList.insertRows(at: [indexPath], with: .automatic)
        ingredientList.endUpdates()
        
        //Reset text field
        addIngredientTextField.text = ""
        view.endEditing(true)
    }
}

//MARK: - Shop-cart-VC cells
extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ingredient = ingredients[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell") as! IngredientCell
        cell.ingredientTitle.text = ingredient
        return cell
    }
    
    // MARK: - Updating delete button when selecting/deselecting row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateDeleteButtonStatus()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        updateDeleteButtonStatus()
    }
}
