//
//  VPNListController.swift
//  TurnOnVPN
//
//  Created by Jeff on 30/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

let kVPNConnectionSection = 0
let kVPNOnDemandSection = 1
let kVPNListSection = 2
let kVPNAddSection = 3

class VPNListController: UITableViewController {

    @IBOutlet weak var restartPingButton: UIBarButtonItem!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(222)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

//extension UINavigationController {
//    open override var childViewControllerForStatusBarHidden: UIViewController? {
//        return self.topViewController
//    }
//
//    open override var childViewControllerForStatusBarStyle: UIViewController? {
//        return self.topViewController
//    }
//}







































