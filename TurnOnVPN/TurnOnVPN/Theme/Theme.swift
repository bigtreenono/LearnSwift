//
//  Theme.swift
//  TurnOnVPN
//
//  Created by Jeff on 02/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

protocol Theme {
    var name : String { get set }
    var defaultBackgroundColor : UIColor { get set }
    var navigationBarColor : UIColor { get set }
    var tintColor                : UIColor { get set }
    var textColor                : UIColor { get set }
    var placeholderColor         : UIColor { get set }
    var textFieldColor           : UIColor { get set }
    var tableViewBackgroundColor : UIColor { get set }
    var tableViewLineColor       : UIColor { get set }
    var tableViewCellColor       : UIColor { get set }
    var switchBorderColor        : UIColor { get set }
}
