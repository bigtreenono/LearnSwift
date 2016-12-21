//
//  VPNEditor.swift
//  TurnOnVPN
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class VPNEditor: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var serverField: UITextField!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var groupField: UITextField!
    @IBOutlet weak var remoteIDField: UITextField!

    @IBOutlet weak var alwaysOnSwitch: UISwitch!
    
    @IBOutlet weak var duplicateCell: TableViewActionCell!
    @IBOutlet weak var deleteCell: TableViewActionCell!
    
    override func loadView() {
        super.loadView()
        tableView.backgroundView = ControllerBackgroundView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}








































