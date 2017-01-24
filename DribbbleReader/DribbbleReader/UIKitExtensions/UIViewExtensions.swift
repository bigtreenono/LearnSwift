//
//  UIViewExtension.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func rotateMe() {
        UIView.animate {
            self.transform = self.transform.rotated(by: CGFloat(M_PI))
        }
    }
    
    func viewController() -> UIViewController? {
        var responder = self.next
        
        while responder != nil {
            if responder!.isKind(of: UIViewController.self) {
                return responder as? UIViewController
            }
            responder = responder?.next
        }
        return nil
    }
    
    class func animate(_ animations: @escaping () -> Void) {
        animate(animations, completion: nil)
    }
    
    class func animate(_ animations: @escaping () -> Void, completion: ((Bool) -> Swift.Void)? = nil) {
        UIView.animate(withDuration: animationDuration, animations: animations, completion: completion)
    }
    
    class func keyboardAnimateWithNotification(_ notify: Notification, animations: @escaping () -> Void) {
        let animationInfo = notify.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let options = animationInfo << 16
        UIView.animate(withDuration: notify.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double, delay: 0, options: UIViewAnimationOptions(rawValue: options), animations: animations)
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.reuseIdentifier(), bundle: nil)
    }
    
    class func nibView() -> UIView {
        return self.nibView(self.reuseIdentifier())
    }
    
    class func nibView(_ nibName: String) -> UIView {
        return Bundle.main.loadNibNamed(nibName, owner: nil)?.first as! UIView
    }
    
    class func reuseIdentifier() -> String {
        return self.className
    }
}

extension UITableViewCell {
    class func registerNibTo(tableView: UITableView) {
        tableView.register(self.nib(), forCellReuseIdentifier: self.reuseIdentifier())
    }
    class func registerCellClassTo(tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: self.reuseIdentifier())
    }
}

extension UITableViewHeaderFooterView {
    class func registerNibTo(tableView: UITableView) {
        tableView.register(self.nib(), forHeaderFooterViewReuseIdentifier: self.reuseIdentifier())
    }
}

extension UICollectionViewCell {
    class func registerNibTo(collectionView: UICollectionView) {
        collectionView.register(self.nib(), forCellWithReuseIdentifier: self.reuseIdentifier())
    }
    class func registerCellClassTo(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.reuseIdentifier())
    }
}

extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center.y = newValue
        }
    }
}
































