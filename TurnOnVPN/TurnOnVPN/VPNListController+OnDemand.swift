//
//  VPNListController+OnDemand.swift
//  TurnOnVPN
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import TurnOnVPNKit

extension VPNListController {
    
    @IBAction func didTapOnDemandSwitch(_ sender: UISwitch) {
        VPNManager.sharedManager.onDemand = sender.isOn
        
        if let VPN = VPNDataManager.sharedManager.activatedVPN {
            VPNManager.sharedManager.save(VPN.toAccount())
        }
        
        updateOnDemandCell()
    }
    
    func updateOnDemandCell() {
        let indexSet = IndexSet(integer: kVPNOnDemandSection)
        tableView.reloadSections(indexSet, with: .automatic)
    }
}
