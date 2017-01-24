//
//  NavigationBar.swift
//  DribbbleReader
//
//  Created by Jeff on 04/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func wechatStyle() {
        barStyle = .black
        subviews[0].isOpaque = false
        
        let view = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.screenWidth, height: 64))
        view.isUserInteractionEnabled = false
//        view.alpha = 0.5
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 64)
        gradientLayer.colors = [UIColor(hex: 0x040012, alpha: 0.76).cgColor, UIColor(hex: 0x040012, alpha: 0.28).cgColor]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        view.layer.addSublayer(gradientLayer)
        
        insertSubview(view, at: 0)
    }
}
