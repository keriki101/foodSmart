//
//  HomeViewController.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/21/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let transition = SlideInTransition()
    var topView: UIView?
    var menu = MenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

    }
    
    
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNewViewController(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    
    func transitionToNewViewController(_ menuType: MenuType) {
        
                
        topView?.removeFromSuperview()
        let title = String(describing: menuType).capitalized
        self.title = title
        
        switch menuType {
        case .searchReciepe:
            guard let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "searchVC") else { return }
            view.addSubview(searchVC.view)
            self.topView = searchVC.view
            addChild(searchVC)
            
        case .whatsInYourFridge:
            guard let whatsInYourFridge = self.storyboard?.instantiateViewController(withIdentifier: "fridgeVC") else { return }
            view.addSubview(whatsInYourFridge.view)
            self.topView = whatsInYourFridge.view
            addChild(whatsInYourFridge)
            
        case .shoppingCart:
            guard let shoopingCart = self.storyboard?.instantiateViewController(withIdentifier: "shoppingCartVC") else { return }
            view.addSubview(shoopingCart.view)
            self.topView = shoopingCart.view
            addChild(shoopingCart)
            
        default:
            break
        }
        
    }
}


extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
