//
//  ThemeManager.swift
//  TurnOnVPN
//
//  Created by Jeff on 02/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation
import UIKit

let kCurrentThemeIndexKey = "CurrentThemeIndex"

class ThemeManager {
    
    static let sharedManager = ThemeManager()
    private init() {}
    
    var currentTheme: Theme?
    
    let themes: [Theme] = [DarkTheme(), LightTheme(), HelloKittyTheme(), DarkGreenTheme(), DarkPurpleTheme()]
    
    var themeIndex: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: kCurrentThemeIndexKey)
            UserDefaults.standard.synchronize()
        }
        get {
            return min(UserDefaults.standard.integer(forKey: kCurrentThemeIndexKey), themes.count - 1)
        }
    }
    
    func activateTheme() {
        activateTheme(themes[themeIndex])
    }
    
    func activateTheme(_ theme: Theme) {
        currentTheme = theme
        
        UIWindow.appearance().tintColor = theme.tintColor
        
        ControllerBackgroundView.appearance().backgroundColor = theme.defaultBackgroundColor
        
        UISwitch.appearance().tintColor = theme.switchBorderColor
        UISwitch.appearance().onTintColor = theme.tintColor
        UISwitch.appearance().thumbTintColor = theme.switchBorderColor
        
        UINavigationBar.appearance().barTintColor = theme.navigationBarColor
        UINavigationBar.appearance().tintColor = theme.tintColor
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : theme.textColor]
        
        UITableView.appearance().backgroundColor = theme.tableViewBackgroundColor
        UITableView.appearance().separatorColor = theme.tableViewLineColor
        
        UITableViewCell.appearance().backgroundColor = theme.tableViewCellColor
        UITableViewCell.appearance().tintColor = theme.tintColor
        UITableViewCell.appearance().selectionStyle = .none
        
        TableViewCellTitle.appearance().textColor = theme.textColor
        
        UITextField.appearance().tintColor = theme.tintColor
        UITextField.appearance().textColor = theme.textFieldColor

        UILabel.inside(UITableViewHeaderFooterView.self).textColor = theme.textColor;
        
        
        UITextView.inside(UITableViewCell.self).backgroundColor = theme.tableViewCellColor
        UITextView.inside(UITableViewCell.self).textColor = theme.textColor
    }
    
    func activateNextTheme() {
        var index = themeIndex
        index += 1
        
        themeIndex = index >= themes.count ? 0 : index;
        
        activateTheme(themes[themeIndex])
        
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
    }
}

extension UIView {
    static func inside (_ containerClass: UIAppearanceContainer.Type) -> Self {
        return appearance(for: UITraitCollection(displayScale: UIScreen.main.scale), whenContainedInInstancesOf: [containerClass.self])
    }
}

extension UIBarItem {
    static func inside(_ containerClass: UIAppearanceContainer.Type) -> Self {
        return appearance(for: UITraitCollection(displayScale: UIScreen.main.scale), whenContainedInInstancesOf: [containerClass.self])
    }
}
































