//
//  LightTheme.swift
//  TurnOnVPN
//
//  Created by Jeff on 02/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

struct LightTheme: Theme {
    var name = "Light"
    var defaultBackgroundColor   = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1)
    var navigationBarColor       = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1)
    var tintColor                = UIColor(red:0   , green:0.6 , blue:1   , alpha:1)
    var textColor                = UIColor(red:0.19, green:0.19, blue:0.19, alpha:1)
    var placeholderColor         = UIColor.lightGray
    var textFieldColor           = UIColor.black
    var tableViewBackgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1)
    var tableViewLineColor       = UIColor(red:0.78, green:0.78, blue:0.8 , alpha:1)
    var tableViewCellColor       = UIColor.white
    var switchBorderColor        = UIColor(red:0.78, green:0.78, blue:0.8 , alpha:1)
}
