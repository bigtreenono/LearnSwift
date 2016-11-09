//
//  ViewController.swift
//  SpringAnimateText
//
//  Created by Jeff on 09/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 44))
        button.backgroundColor = UIColor.green
        button.setTitle("Hello World", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonTapped(button: UIButton) {
        button.removeFromSuperview()
        
        let label = UILabel(frame: CGRect(x: 50, y: 30, width: 200, height: 44))
        label.font = UIFont.systemFont(ofSize: 40)
//        label.textAlignment = .center
        label.backgroundColor = UIColor.cyan
        label.text = "hello"
//        label.center = CGPoint(x: 200, y: 30)
        view.addSubview(label)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, animations: {
            label.center = CGPoint(x: 200, y: 200)
        })
        
        // test
    }
}




















