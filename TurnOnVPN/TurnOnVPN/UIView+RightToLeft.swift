//
//  UIView+RightToLeft.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

extension UIView {
    var isRightToLeft: Bool {
        if #available(iOS 9.0, *) {
            return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
        } else {
            return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
        }
    }
}
