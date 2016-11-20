//
//  ViewController.swift
//  SpotIt
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data: NSMutableArray!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = NSMutableArray(contentsOfFile: Bundle.main.path(forResource: "MoviesData.plist", ofType: nil)!)
        
        var searchableItems = [CSSearchableItem]()
        
        for i in 0 ..< data.count {
            
            let movie = data[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            //set the title
            searchableItemAttributeSet.title = movie["Title"]!
            
            //set the image
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            
            // Set the description.
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.components(separatedBy: ", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.components(separatedBy: ", ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            
            searchableItems.append(searchableItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
                if error != nil {
                    print(error?.localizedDescription ?? "error")
                }
            }
        }
        
        tableView = UITableView()
        tableView.rowHeight = 100
        tableView.register(MovieCell.self, forCellReuseIdentifier: NSStringFromClass(MovieCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                let selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)!
                let dic = data[selectedMovieIndex] as! [String: String]
                navigationController?.pushViewController(MovieDetailViewController(dic["Title"]!), animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = data[indexPath.row] as! [String: String]
        navigationController?.pushViewController(MovieDetailViewController(dic["Title"]!), animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MovieCell.self), for: indexPath) as! MovieCell
        
        let dic = data[indexPath.row] as! [String: String]
        let imageName = dic["Image"]!
        let desc = dic["Description"]!
        let title = dic["Title"]!
        let rating = dic["Rating"]!
        
        cell.movieImage.image = UIImage(named: imageName)
        cell.titleLabel.text = title
        cell.subTitleLabel.text = desc
        cell.ratingLabel.text = rating
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}






































