//
//  HomeViewController.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/21/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    

    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
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
