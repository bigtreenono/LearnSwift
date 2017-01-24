//
//  NavigationController.swift
//  DribbbleReader
//
//  Created by Jeff on 04/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import BFKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bar = UINavigationBar.appearance()
        bar.titleTextAttributes = [NSForegroundColorAttributeName: JCColor.navigationBarTitleTextColor]
        bar.barTintColor = JCColor.navigationBarBackgroundColor
        bar.shadowImage = UIImage()
        bar.setBackgroundImage(UIImage(), for: .default)
        bar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
























