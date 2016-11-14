//
//  ViewController.swift
//  Carousel Effect
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

private let reuseIdentifier = "reuseIdentifier"
private let heightOfCollectionView: CGFloat = 400

class ViewController: UIViewController, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    
    let models = [ Model(image: UIImage(named: "hello")!, title: "hello"),
                   Model(image: UIImage(named: "dudu")!, title: "dudu"),
                   Model(image: UIImage(named: "bodyline")!, title: "bodyline"),
                   Model(image: UIImage(named: "wave")!, title: "wave"),
                   Model(image: UIImage(named: "darkvarder")!, title: "darkvarder"),
                   Model(image: UIImage(named: "hhhhh")!, title: "hhhhh"),
                   Model(image: UIImage(named: "run")!, title: "run") ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageViwe = UIImageView(frame: view.bounds)
        backgroundImageViwe.image = UIImage(named: "blue")
        view.addSubview(backgroundImageViwe)
        
        let visualEffectView = UIVisualEffectView(frame: backgroundImageViwe.bounds)
        visualEffectView.effect = UIBlurEffect(style: .light)
        view.addSubview(visualEffectView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: heightOfCollectionView)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width:view.bounds.width, height: heightOfCollectionView), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.model = models[indexPath.item]
        return cell
    }
}








































