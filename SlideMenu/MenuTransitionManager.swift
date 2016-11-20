//
//  MenuTransitionManager.swift
//  SlideMenu
//
//  Created by Jeff on 18/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

@objc protocol MenuTransitionManagerDelegate: class {
    func dismiss()
}

class MenuTransitionManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    weak var delegate: MenuTransitionManagerDelegate?
    let duration = 0.5
    var isPresenting = false
    var snapshot: UIView? {
        didSet {
            if let delegate = delegate {
                snapshot?.addGestureRecognizer(UITapGestureRecognizer(target: delegate, action: #selector(MenuTransitionManagerDelegate.dismiss)))
            }
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        print(444)
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let containerView = transitionContext.containerView
        
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        if isPresenting {
            toView.transform = moveUp
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            containerView.addSubview(toView)
            containerView.addSubview(snapshot!)
        }
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, animations: { [unowned self] in
            if self.isPresenting {
                self.snapshot?.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height - 150)
                toView.transform = CGAffineTransform.identity
            } else {
                toView.transform = CGAffineTransform.identity
                fromView.transform = moveUp
            }
        }, completion: { finished in
            transitionContext.completeTransition(true)
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        })
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        print(111)
        return self
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        print(222)
        return self
    }
}























