//
//  TableViewActionCell.swift
//  TurnOnVPN
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class TableViewActionCell: UITableViewCell {
    
    var disabled: Bool {
        get {
            return false
        }
        set {
            if newValue {
                textLabel?.textColor = ThemeManager.sharedManager.currentTheme?.textColor
            } else {
                textLabel?.textColor = ThemeManager.sharedManager.currentTheme?.tintColor
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
