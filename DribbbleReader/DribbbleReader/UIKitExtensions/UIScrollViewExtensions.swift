//
//  UIScrollViewExtensions.swift
//  DribbbleReader
//
//  Created by Jeff on 05/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    @IBInspectable var scrollTop: Bool {
        get {
            return scrollsToTop
        }
        set {
            scrollsToTop = newValue
        }
    }
}
