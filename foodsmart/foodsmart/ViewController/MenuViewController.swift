//
//  MenuViewController.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/21/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit


enum MenuType: Int {
    
    case home
    case searchReciepe
    case whatsInYourFridge
    case shoppingCart
}


class MenuViewController: UITableViewController {
    
    var didTapMenuType : ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }



}
