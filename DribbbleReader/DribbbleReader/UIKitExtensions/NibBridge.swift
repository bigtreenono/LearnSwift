//
//  NibBridge.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

final class NibBridgeImplementation {
    class func instantiateRealViewFromPlaceholder(_ placeholderView: UIView) -> UIView {
        
        let realView = type(of: placeholderView).nibView()
        realView.tag = placeholderView.tag
        realView.frame = placeholderView.frame
        realView.bounds = placeholderView.bounds
        realView.isHidden = placeholderView.isHidden
        realView.clipsToBounds = placeholderView.clipsToBounds
        realView.autoresizingMask = placeholderView.autoresizingMask
        realView.isUserInteractionEnabled = placeholderView.isUserInteractionEnabled
        realView.translatesAutoresizingMaskIntoConstraints = placeholderView.translatesAutoresizingMaskIntoConstraints
        
        for constraint in placeholderView.constraints {
            var newConstraint: NSLayoutConstraint?
            
            if constraint.secondItem == nil {
                newConstraint = NSLayoutConstraint(item: realView, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: nil, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant)
            } else if (constraint.firstItem.isEqual(constraint.secondItem)) {
                newConstraint = NSLayoutConstraint(item: realView, attribute: constraint.firstAttribute, relatedBy: constraint.relation, toItem: realView, attribute: constraint.secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant)
            }
            
            if newConstraint != nil {
                newConstraint!.shouldBeArchived = constraint.shouldBeArchived
                newConstraint!.priority = constraint.priority
                newConstraint!.identifier = constraint.identifier
                realView.addConstraint(newConstraint!)
            }
        }
        
        return realView
    }
}






//extension UIViewController {
//    override open static func initialize() {
//        if self !== UIViewController.self {
//            return
//        }
//        
//        _ = {
//            UIViewController.swizzleMethods(originalSelector: #selector(viewWillAppear), swizzledSelector: #selector(jc_viewWillAppear))
//        }()
//    }
//
//    func jc_viewWillAppear(animated: Bool) {
//        self.jc_viewWillAppear(animated: animated)
//    }
//}

































