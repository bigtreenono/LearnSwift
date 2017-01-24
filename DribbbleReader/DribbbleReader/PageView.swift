//
//  PageView.swift
//  DribbbleReader
//
//  Created by Jeff on 08/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class PageView: NibNestableView {

    var controllers: [UIViewController]? {
        didSet {
            segmentView.controllers = controllers
            collectionView.reloadData()
        }
    }
    
    private var collectionView: UICollectionView!
    private var segmentView: PagedSegmentView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        segmentView = PagedSegmentView()
        segmentView.SelectedCallback = { index in
            log?.debug("index \(index)")
        }
        addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(kHeightOfPagedSegmentView)
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = JCColor.viewBackgroundColor
        collectionView.scrollsToTop = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        UICollectionViewCell.registerCellClassTo(collectionView: collectionView)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
        // ios 7.1.1
        super.layoutSubviews()
    }
}

extension PageView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controllers?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.reuseIdentifier(), for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.backgroundColor = UIColor.random()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.size
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}




































