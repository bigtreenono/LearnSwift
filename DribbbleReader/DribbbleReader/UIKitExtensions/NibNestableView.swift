//
//  NibNestableView.swift
//  DribbbleReader
//
//  Created by Jeff on 08/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class NibNestableView: UIView {
    
    private var once = true
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        if subviews.count == 0 {
            return NibBridgeImplementation.instantiateRealViewFromPlaceholder(self)
        }
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if once {
            once = false
        } else {
            handleAwakeFromNib()
        }
    }
    
    func handleAwakeFromNib() {}
}
