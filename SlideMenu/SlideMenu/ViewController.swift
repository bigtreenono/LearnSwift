//
//  ViewController.swift
//  SlideMenu
//
//  Created by Jeff on 17/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
//    var data: []!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Everyday Moments"
        
        tableView = UITableView(frame: view.bounds)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

