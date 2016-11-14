//
//  ViewController.swift
//  animateTable
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let data = [ "Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView = UITableView(frame: view.bounds)
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GradationalCell.self, forCellReuseIdentifier: NSStringFromClass(GradationalCell.self))
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        for (index, cell) in tableView.visibleCells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
            
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(GradationalCell.self), for: indexPath) as! GradationalCell
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let color = CGFloat(indexPath.row) / CGFloat(data.count - 1) * 0.6
        cell.contentView.backgroundColor = UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}









































