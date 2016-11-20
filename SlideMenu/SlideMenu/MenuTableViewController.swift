//
//  MenuTableViewController.swift
//  SlideMenu
//
//  Created by Jeff on 18/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MenuTableViewCell.self))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MenuTableViewCell.self), for: indexPath) as! MenuTableViewCell
        cell.contentView.backgroundColor = .black
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = menuItems.index(of: currentItem) == indexPath.row ? .white : .lightGray
        cell.textLabel?.backgroundColor = .black
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
}
