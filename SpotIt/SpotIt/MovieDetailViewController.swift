//
//  MovieDetailViewController.swift
//  SpotIt
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {
    
    var movieTitle: String!
    
    convenience init(_ title: String) {
        self.init()
        movieTitle = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = movieTitle
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
}
