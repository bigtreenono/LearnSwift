//
//  TableViewCellDeclosureIndicator.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

let lineWidth = CGFloat(1.5)

class TableViewCellDeclosureIndicator: UIView {

    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            backgroundColor = .clear
        }
    }
    
    override func draw(_ rect: CGRect) {
        let delta = CGFloat(5)
        let centerX = rect.width / 2
        let middleY = rect.height / 2
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        if isRightToLeft {
            context.move(to: CGPoint(x: centerX + delta / 2, y: middleY - delta))
            context.addLine(to: CGPoint(x: centerX - delta / 2, y: middleY))
            context.addLine(to: CGPoint(x: centerX + delta / 2, y: middleY + delta))
        } else {
            context.move(to: CGPoint(x: centerX - delta / 2, y: middleY - delta))
            context.addLine(to: CGPoint(x: centerX + delta / 2, y: middleY))
            context.addLine(to: CGPoint(x: centerX - delta / 2, y: middleY + delta))
        }
        
        context.setLineWidth(lineWidth)
        context.setLineJoin(.miter)
        context.setLineCap(.square)
        
        if let textColor = ThemeManager.sharedManager.currentTheme?.textColor {
            context.setStrokeColor(textColor.cgColor)
        }
        
        context.strokePath()
    }
}
