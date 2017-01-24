//
//  UIGestureRecognizerExtension.swift
//  DribbbleReader
//
//  Created by Jeff on 03/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

extension UIGestureRecognizer: Closurable {
    
    convenience init(closure: @escaping (UIGestureRecognizer) -> Void) {
        self.init()
        let container = closureContainer(for: closure)
        addTarget(container, action: container.action)
    }
}
