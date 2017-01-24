//
//  GradientButton.swift
//  DribbbleReader
//
//  Created by Jeff on 07/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class GradientButton: UIButton {
    
    var normalFontSize: CGFloat = 15, selectedFontSize: CGFloat = 15
    var normalColor = (92, 95, 102)
    var selectedColor = (214, 160, 36)
    
    var progress: CGFloat = 0 {
        didSet {
            let normalR = CGFloat(normalColor.0) / 255, normalG = CGFloat(normalColor.1) / 255, normalB = CGFloat(normalColor.2) / 255
            let selectedR = CGFloat(selectedColor.0) / 255, selectedG = CGFloat(selectedColor.1) / 255, selectedB = CGFloat(selectedColor.2) / 255
            
            let r: CGFloat = selectedR - normalR, g: CGFloat = selectedG - normalG, b: CGFloat = selectedB - normalB
            
            setTitleColor(UIColor(red: normalR + progress * r, green: normalG + progress * g, blue: normalB + progress * b, alpha: 1), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            progress = isSelected ? 1 : 0
            titleLabel?.font = UIFont.systemFont(ofSize: isSelected ? selectedFontSize : normalFontSize)
        }
    }
}
