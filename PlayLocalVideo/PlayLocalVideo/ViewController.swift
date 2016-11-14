//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    let videoes = [ Video(imageName: "videoScreenshot01", title: "Introduce 3DS Mario", subTitle: "Youtube - 06:32"),
                    Video(imageName: "videoScreenshot02", title: "Emoji Among Us", subTitle: "Vimeo - 3:34"),
                    Video(imageName: "videoScreenshot03", title: "Seals Documentary", subTitle: "Vine - 00:06"),
                    Video(imageName: "videoScreenshot04", title: "Adventure Time", subTitle: "Youtube - 02:39"),
                    Video(imageName: "videoScreenshot05", title: "Facebook HQ", subTitle: "Facebook - 10:20"),
                    Video(imageName: "videoScreenshot06", title: "Lijiang Lugu Lake", subTitle: "Allen - 20:30"),
                    Video(imageName: "videoScreenshot01", title: "Introduce 3DS Mario", subTitle: "Vimeo - 3:34"),
                    Video(imageName: "videoScreenshot02", title: "Emoji Among Us", subTitle: "Youtube - 06:32"),
                    Video(imageName: "videoScreenshot03", title: "Seals Documentary", subTitle: "Vine - 00:06"),
                    Video(imageName: "videoScreenshot04", title: "Adventure Time", subTitle: "Youtube - 02:39") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Watch Later"
        
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 220.0
        tableView.register(VideoCell.self)
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VideoCell = tableView.dequeueReusableCell(for: indexPath)
        cell.video = videoes[indexPath.row]
        return cell
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
//    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
//        let bundle = Bundle(for: T.self)
//        let nib = UINib(nibName: T.nibName, bundle: bundle)
//        
//        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
//    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }    
}

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: NibLoadableView {}


//extension BookCell: NibLoadableView {
//}






















