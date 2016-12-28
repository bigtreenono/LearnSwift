//
//  UIButtonExtension.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import BFKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(UIImage(color: color), for: state)
    }

    private struct AssociatedKeys {
        static var DescriptiveName = "DescriptiveName"
    }

    func addTarget(for controlEvents: UIControlEvents, withClosure closure: @escaping (UIButton) -> Void) {
        let closureSelector = ClosureSelector(closure)
        objc_setAssociatedObject(self, &AssociatedKeys.DescriptiveName, closureSelector, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(closureSelector, action: closureSelector.selector, for: controlEvents)
    }
}





























