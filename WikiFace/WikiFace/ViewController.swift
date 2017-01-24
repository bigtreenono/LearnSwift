//
//  ViewController.swift
//  WikiFace
//
//  Created by Jeff on 20/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!

    class let test: [Any] = ["a" as NSString, 0 as NSNumber]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let elonMuskButton = UIButton()
        elonMuskButton.backgroundColor = .lightGray
        elonMuskButton.setTitle("Elon Musk", for: .normal)
        elonMuskButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        view.addSubview(elonMuskButton)
        elonMuskButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(44)
            make.width.equalToSuperview().multipliedBy(1.0 / 3)
        }
        
        let jonathanIveButton = UIButton()
        jonathanIveButton.backgroundColor = .red
        jonathanIveButton.setTitle("Jonathan ive", for: .normal)
        jonathanIveButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        view.addSubview(jonathanIveButton)
        jonathanIveButton.snp.makeConstraints { (make) in
            make.left.equalTo(elonMuskButton.snp.right)
            make.width.height.top.equalTo(elonMuskButton)
//            make.top.equalTo(elonMuskButton)
        }
        
        let steveJobsButton = UIButton()
        steveJobsButton.backgroundColor = .blue
        steveJobsButton.setTitle("Steve Jobs", for: .normal)
        steveJobsButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        view.addSubview(steveJobsButton)
        steveJobsButton.snp.makeConstraints { (make) in
            make.left.equalTo(jonathanIveButton.snp.right)
            make.width.height.top.equalTo(elonMuskButton)
        }
        
        imageView = UIImageView()
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview().inset(UIEdgeInsetsMake(0, 20, 20, 20))
            make.height.equalTo(400)
        }
    }

    func buttonsTapped(button: UIButton) {
        print(button.title(for: .normal))
        
        WikiFace.requestFaceInfo(with: button.title(for: .normal)!, size: CGSize(width: 300, height: 400)) { [unowned self] (image, didFoundImage) in
            print(image, didFoundImage, Thread.current.isMainThread)
            if didFoundImage {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    WikiFace.zoomInFace(self.imageView)
                }
            }
            
        }
    }
}



















