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
}

extension UIButton: Closurable {
    
    func addTarget(for controlEvents: UIControlEvents = .touchUpInside, withClosure closure: @escaping (UIButton) -> Void) {
        let container = closureContainer(for: closure)
        addTarget(container, action: container.action, for: controlEvents)
    }
}



























