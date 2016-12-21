//
//  VPNSwitchCell.swift
//  TurnOnVPN
//
//  Created by Jeff on 20/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class VPNSwitchCell: VPNTableViewCell {
    
    @IBOutlet weak var titleLabel: TableViewCellTitle!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if superview != nil && isRightToLeft {
            titleLabel.textAlignment = .right
        }
    }
}
