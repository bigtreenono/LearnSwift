//
//  NormalTableViewCell.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

private let kAccessoryWidth = CGFloat(20)

class NormalTableViewCell: UITableViewCell {
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil || accessoryType != .disclosureIndicator {
            return
        }
        
        if accessoryView == nil {
            accessoryView = TableViewCellDeclosureIndicator()
            accessoryView?.frame = CGRect(x: 0, y: 0, width: kAccessoryWidth, height: kAccessoryWidth)
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
