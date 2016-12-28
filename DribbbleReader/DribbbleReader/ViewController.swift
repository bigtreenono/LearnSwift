//
//  ViewController.swift
//  DribbbleReader
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: JCColor.navigationBarTitleTextColor]
        navigationController?.navigationBar.barTintColor = JCColor.navigationBarBackgroundColor
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        NibBridgeImplementation().hackedAwakeAfterUsingCoder(decoder: NSCoder())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

