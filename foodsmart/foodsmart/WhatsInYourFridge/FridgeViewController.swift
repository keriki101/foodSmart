//
//  FridgeTableViewController.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/29/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController {
    
    
    
    @IBOutlet weak var fridgeTableView: UITableView!
    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    var ingredientsInFridge: [String] = ["curry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveIngredient()
        updateDeleteButtonStatus()

        fridgeTableView.allowsMultipleSelectionDuringEditing = true
     
    }
    
    
    //Save ingredient
    func saveIngredient() {
            
        let savedIngredient = UserDefaults.standard.object(forKey: "saveIngredientInFridge")

        if let ingredient = savedIngredient as? [String] {
                ingredientsInFridge = ingredient
        }
    }
        
        
    //Add new ingredients
    func insertNewIngredientTitle() {
            
        ingredientsInFridge.append(addIngredientTextField.text!)
        // save the new ingredient
        UserDefaults.standard.set(ingredientsInFridge, forKey: "saveIngredientInFridge")
        let indexPath = IndexPath(row: ingredientsInFridge.count - 1, section: 0)
            
        fridgeTableView.beginUpdates()
        fridgeTableView.insertRows(at: [indexPath], with: .automatic)
        fridgeTableView.endUpdates()
            
        //Reset text field
        addIngredientTextField.text = ""
        view.endEditing(true)
    }
    
    
    func updateDeleteButtonStatus() {
        
        func setButtonTitle(title: String, enabled: Bool) {
            deleteButton.setTitle(title, for: .normal)
            deleteButton.isEnabled = enabled
        }
        
        let rootButtonTitle = "Delete"
        
        if fridgeTableView.isEditing != true {
            setButtonTitle(title: rootButtonTitle, enabled: false)
        } else {
            if let selection = fridgeTableView.indexPathsForSelectedRows {
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

    
    @IBAction func addRow(_ sender: Any) {
        
        if addIngredientTextField.text == "" {
            return
        } else {
            insertNewIngredientTitle()
        }
    }
    
    @IBAction func searchRecipeTapped(_ sender: Any) {
        
        
        
        
    }
    
    @IBAction func editButtontapped(_ sender: UIButton) {
        
        fridgeTableView.setEditing(!fridgeTableView.isEditing, animated: true)
                     
        sender.setTitle(fridgeTableView.isEditing ? "Done" : "Edit", for: .normal)
        updateDeleteButtonStatus()
    }
    
    @IBAction func reloadButtonTapped(_ sender: UIButton) {
        
        fridgeTableView.reloadData()
        updateDeleteButtonStatus()
        
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
        if var selection = fridgeTableView.indexPathsForSelectedRows {
            if selection.count > 0 {
                selection.sort() { $1.compare($0) == .orderedAscending }
                         
                for indexPath in selection {
                ingredientsInFridge.remove(at: indexPath.row)
                UserDefaults.standard.set(ingredientsInFridge, forKey: "saveIngredientInFridge")

                }
                fridgeTableView.deleteRows(at: selection, with: .automatic)
                updateDeleteButtonStatus()
            }
        }
    }
    
}

    // MARK: - Table view data source

   extension FridgeViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ingredientsInFridge.count
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let ingredientInFridge = ingredientsInFridge[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fridgeCell") as! FridgeCell
            cell.fridgeLabel.text = ingredientInFridge
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

