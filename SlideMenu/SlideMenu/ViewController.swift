//
//  ViewController.swift
//  SlideMenu
//
//  Created by Jeff on 17/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MenuTransitionManagerDelegate {
    
    var tableView: UITableView!
    var data = [[Moment]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Everyday Moments"
        
        let rightBarButtonItem = UIBarButtonItem(title: "🍔", style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.leftBarButtonItem = rightBarButtonItem
        
        tableView = UITableView(frame: view.bounds)
        tableView.rowHeight = 240
        tableView.register(MomentCell.self, forCellReuseIdentifier: NSStringFromClass(MomentCell.self))
        tableView.dataSource = self
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        
        for _ in 0...2 {
            var array = [Moment]()
            for i in 0...3 {
                var backgroundImageName: String!
                var avatarImageName: String!
                var title: String!
                var name: String!
                switch i {
                case 0:
                    backgroundImageName = "1"
                    avatarImageName = "a"
                    title = "Love mountain."
                    name = "Allen Wang"
                case 1:
                    backgroundImageName = "2"
                    avatarImageName = "b"
                    title = "New graphic design - LIVE FREE"
                    name = "Cole"
                case 2:
                    backgroundImageName = "3"
                    avatarImageName = "c"
                    title = "Summer sand"
                    name = "Daniel Hooper"
                case 3:
                    backgroundImageName = "4"
                    avatarImageName = "d"
                    title = "Seeking for signal"
                    name = "Noby-Wan Kenobi"
                default:break
                }
                array.append(Moment(backgroundImageName: backgroundImageName, avatarImageName: avatarImageName, title: title, name: name))
            }
            data.append(array)
        }
    }
    
    func rightBarButtonItemTapped() {
        let menuVC = MenuTableViewController()
        menuVC.currentItem = navigationItem.title
        let menuTransitionManager = MenuTransitionManager()
        menuTransitionManager.delegate = self
        menuVC.transitioningDelegate = menuTransitionManager
        present(menuVC, animated: true)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MomentCell.self), for: indexPath) as! MomentCell
        cell.moment = data[indexPath.section][indexPath.row]
        return cell
    }
}
























