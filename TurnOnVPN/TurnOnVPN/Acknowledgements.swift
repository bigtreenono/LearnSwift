//
//  Acknowledgements.swift
//  TurnOnVPN
//
//  Created by Jeff on 20/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class Acknowledgements: UITableViewController {
    
    var acknowledgements: [NSDictionary]? {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(R.nib.tableViewCellHaha)
        
        tableView.backgroundView = ControllerBackgroundView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        guard let plistURL = Bundle.main.url(forResource: "Acknowledgements.plist", withExtension: nil) else { return assert(true, "Failed to load Acknowledgements.plist") }
        
        if let array = NSArray(contentsOf: plistURL) as? [NSDictionary] {
            acknowledgements = array;
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return acknowledgements?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcknowledgementCell", for: indexPath) as! AcknowledgementCell

        let acknowledgement = acknowledgements![indexPath.section]
        
        cell.titleLabel.text = acknowledgement["title"] as? String
        cell.contentLabel.text = acknowledgement["text"] as? String
        
        return cell
    }
}





































