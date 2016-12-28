//
//  NibBridge.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

protocol NibBridge {
    
}

final class NibBridgeImplementation: NSObject {
    override open static func initialize() {
        if self !== NibBridgeImplementation.self {
            return
        }
        _ = {
            let originalMethod = class_getInstanceMethod(UIView.self, #selector(awakeAfter(using:)))
            let swizzledMethod = class_getInstanceMethod(self, #selector(hackedAwakeAfterUsingCoder))
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }()
    }
    
    func hackedAwakeAfterUsingCoder(decoder: NSCoder) -> Any {
        
//        if let _ = type(of: self) as? NibBridge,
//            let view = self as? UIView,
//            view.subViews.count == 0 {
//            
//        }
        
//        if type(of: self).conforms(to: NibBridge) {
//            
//        }
        print("1111111111111111111111111111111111 \(type(of: self)) \(self)")
        return self
    }

}

extension UIViewController {
    override open static func initialize() {
        if self !== UIViewController.self {
            return
        }
        _ = {
            UIViewController.swizzleMethods(originalSelector: #selector(viewWillAppear), swizzledSelector: #selector(jc_viewWillAppear))
        }()
    }
    
    func jc_viewWillAppear(animated: Bool) {
        self.jc_viewWillAppear(animated: animated)
    }
}

































