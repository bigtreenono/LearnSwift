//
//  VPNListController+TableView.swift
//  TurnOnVPN
//
//  Created by Jeff on 02/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation
import UIKit
import TurnOnVPNKit

let kVPNConnectionSection = 0
let kVPNOnDemandSection = 1
let kVPNListSection = 2
let kVPNAddSection = 3

fileprivate func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

extension VPNListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case kVPNOnDemandSection:
            return VPNManager.sharedManager.onDemand ? 2 : 1
        case kVPNListSection:
            return vpns?.count ?? 0
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case kVPNConnectionSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionCell", for: indexPath) as! VPNSwitchCell
            cell.titleLabel.text = connectionStatus
            cell.switchButton.isOn = connectionOn
            cell.switchButton.isEnabled = vpns?.count > 0
            return cell
            
        case kVPNOnDemandSection:
            if indexPath.row == 0 {
                let switchCell = tableView.dequeueReusableCell(withIdentifier: "OnDemandCell", for: indexPath) as! VPNSwitchCell
                switchCell.switchButton.isOn = VPNManager.sharedManager.onDemand
                return switchCell
            }
            let domainsCell = tableView.dequeueReusableCell(withIdentifier: "DomainsCell", for: indexPath)
//            let domainsCount = VPNManager.sharedManager.onde
            return domainsCell
            
        case kVPNListSection:
            let cell = tableView.dequeueReusableCell(withIdentifier: "VPNCell", for: indexPath) as! VPNTableViewCell
            guard let vpn = vpns?[indexPath.row] else { return cell }
            
            return cell
            
        default:
            let addCell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath)
            
            return addCell
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == kVPNListSection {
            VPNDataManager.sharedManager.selectedVPNID = vpns?[indexPath.row].objectID
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == kVPNAddSection {
            VPNDataManager.sharedManager.selectedVPNID = nil
        } else if indexPath.section == kVPNListSection {
            activatedVPNID = vpns?[indexPath.row].ID
            VPNManager.sharedManager.activatedVPNID = activatedVPNID
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == kVPNListSection && vpns?.count > 0 {
            return "VPN CONFIGURATIONOS"
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == kVPNListSection {
            return 60
        }
        return 44
    }
}

































