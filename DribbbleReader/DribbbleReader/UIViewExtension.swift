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
        UIView.animate(withDuration: animationDuration, animations: animations)
    }
    
    class func animate(_ animations: @escaping () -> Void, completion: ((Bool) -> Swift.Void)? = nil) {
        UIView.animate(withDuration: animationDuration, animations: animations, completion: completion)
    }
    
    class func keyboardAnimateWithNotification(_ notify: Notification, animations: @escaping () -> Void) {
        let animationInfo = notify.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let options = animationInfo << 16
        UIView.animate(withDuration: notify.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double, delay: 0, options: UIViewAnimationOptions(rawValue: options), animations: animations)
    }
    
    class func nibView() -> UIView {
        return self.nibView(self.reuseIdentifier())
    }
    
    class func nibView(_ nibName: String) -> UIView {
        return Bundle.main.loadNibNamed(nibName, owner: nil)?.first as! UIView
    }
    
    class func nib() -> UINib {
        return UINib(nibName: NSStringFromClass(self), bundle: nil)
    }
    
    class func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell {
    class func registerNibToTableView(_ tableView: UITableView) {
        tableView.register(self.nib(), forCellReuseIdentifier: self.reuseIdentifier())
    }
}

extension UITableViewHeaderFooterView {
    class func registerNibToTableView(_ tableView: UITableView) {
        tableView.register(self.nib(), forHeaderFooterViewReuseIdentifier: self.reuseIdentifier())
    }
}

extension UICollectionViewCell {
    class func registerNibToCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(self.nib(), forCellWithReuseIdentifier: self.reuseIdentifier())
    }
}































