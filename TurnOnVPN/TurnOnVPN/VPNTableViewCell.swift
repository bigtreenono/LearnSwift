//
//  VPNTableViewCell.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

private let kAccessoryWidth: CGFloat = 16
let kRightMargin: CGFloat = 36

class VPNTableViewCell: NormalTableViewCell {

    var IKEv2 = false {
        didSet { setNeedsDisplay() }
    }
    
    var current = false {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        if IKEv2 {
            let tagWidth: CGFloat = 34
            let tagHeight: CGFloat = 14
            let tagX: CGFloat
            
            if isRightToLeft {
                tagX = kAccessoryWidth + kRightMargin + (accessoryView?.frame.maxX ?? 0)
            } else {
                tagX = bounds.width - tagWidth - kAccessoryWidth - kRightMargin
            }
            
            let tagY = (bounds.height - tagHeight) / 2
            drawIKEv2Tag(radius: 2, rect: CGRect(x: tagX, y: tagY, width: tagWidth, height: tagHeight), tagText: "IKEv2", color: tintColor)
        }
        if current {
            let currentIndicatorRect = CGRect(x: 0, y: 0, width: 7, height: rect.height)
            let rectanglePath = UIBezierPath(rect: currentIndicatorRect)
            ThemeManager.sharedManager.currentTheme?.tintColor.setFill()
            rectanglePath.fill()
        }
    }

    func drawIKEv2Tag(radius: CGFloat, rect: CGRect, tagText: String, color: UIColor) {
        let context = UIGraphicsGetCurrentContext()
        
        let height = rect.size.height / 1.20
        
        let rectanglePath = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        color.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        let mutableParagraphStyle = NSMutableParagraphStyle.default as! NSMutableParagraphStyle
        mutableParagraphStyle.alignment = .center
        
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: height - 1),
                          NSForegroundColorAttributeName: color,
                          NSParagraphStyleAttributeName: mutableParagraphStyle]
        
        let textHeight: CGFloat = NSString(string: tagText).boundingRect(with: CGSize(width: rect.width, height: CGFloat.infinity),
                                                                         options: .usesLineFragmentOrigin,
                                                                         attributes: attributes,
                                                                         context: nil).size.height
        
        context?.saveGState()
        context?.clip(to: rect)
        
        NSString(string: tagText).draw(in: CGRect(x: rect.minX, y: rect.minY + (rect.height - textHeight) / 2, width: rect.width, height: textHeight), withAttributes: attributes)
        context?.restoreGState()
    }
}





































