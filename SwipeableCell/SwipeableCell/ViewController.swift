//
//  ViewController.swift
//  SwipeableCell
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    let data = [
        Pattern(imageName: "1", title: "Pattern Building"),
        Pattern(imageName: "2", title: "Joe Beez"),
        Pattern(imageName: "3", title: "Car It's car"),
        Pattern(imageName: "4", title: "Floral Kaleidoscopic"),
        Pattern(imageName: "5", title: "Sprinkle Pattern"),
        Pattern(imageName: "6", title: "Palitos de queso"),
        Pattern(imageName: "7", title: "Ready to Go? Pattern"),
        Pattern(imageName: "8", title: "Sets Seamless"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds)
        tableView.rowHeight = 50
        tableView.register(SwipeableCell.self, forCellReuseIdentifier: NSStringFromClass(SwipeableCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "🗑\nDelete"){ (action, indexPath) in
            print(action, indexPath)
        }
        deleteAction.backgroundColor = .red
        
        let shareAction = UITableViewRowAction(style: .destructive, title: "🤗\nShare"){ [unowned self] (action, indexPath) in
            print(action, indexPath)
            
            self.present(UIActivityViewController(activityItems: [ "test" ], applicationActivities: nil), animated: true)
        }
        shareAction.backgroundColor = .blue
        
        let downloadAction = UITableViewRowAction(style: .default, title: "⬇️\nDownload"){(action, indexPath) in
            print(action, indexPath)
        }
        downloadAction.backgroundColor = .gray
        
        return [deleteAction, shareAction, downloadAction]
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SwipeableCell.self), for: indexPath) as! SwipeableCell
        
        cell.pattern = data[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}































