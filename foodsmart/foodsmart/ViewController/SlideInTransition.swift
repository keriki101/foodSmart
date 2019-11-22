//
//  SlideInTransition.swift
//  foodsmart
//
//  Created by Debora Johansson on 11/22/19.
//  Copyright © 2019 JUDevTeam. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.55
        let finalHeight = toViewController.view.bounds.height
        
        // Add MenuViewController to container
        if isPresenting {
            // Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds

            
            containerView.addSubview(toViewController.view)
            
            //Init frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
            
            //Animate on screen
            let transform = {
                self.dimmingView.alpha = 0.5
                toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
            }
            
            //Animate back off screen
            let identity = {
                self.dimmingView.alpha = 0.0
                fromViewController.view.transform = .identity
            }
            
            //Animation off the transition
            let duration = transitionDuration(using: transitionContext)
            let isCancelled = transitionContext.transitionWasCancelled
            UIView.animate(withDuration: duration, animations: {
                self.isPresenting ? transform() : identity()
            }) { (_) in
                transitionContext.completeTransition(!isCancelled)
            }
            
        }
        
    }


