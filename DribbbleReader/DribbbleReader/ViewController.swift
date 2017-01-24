//
//  ViewController.swift
//  DribbbleReader
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pagedView: PageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["Popular", "GIFs", "Teams", "Rebounds"]
        var controllers = [UIViewController]()
        
        titles.forEach {
            let controller = UIViewController()
            controller.title = $0
            controllers.append(controller)
        }
        
        pagedView.controllers = controllers
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.tableViewCell1)!
        cell.avatar.image = R.image.icon_512x512()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
























