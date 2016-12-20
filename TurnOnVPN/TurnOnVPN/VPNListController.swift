//
//  VPNListController.swift
//  TurnOnVPN
//
//  Created by Jeff on 30/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import TurnOnVPNKit

class VPNListController: UITableViewController {

    @IBOutlet weak var restartPingButton: UIBarButtonItem!
    
    var vpns: [VPN]?
    var activatedVPNID: String?
    var connectionStatus = "Not Connected"
    var connectionOn = false
    var pendingProfile = false
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(222)
    }
}








































