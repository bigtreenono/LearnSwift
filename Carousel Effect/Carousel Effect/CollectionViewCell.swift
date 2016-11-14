//
//  CollectionViewCell.swift
//  Carousel Effect
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var model: Model! {
        didSet {
            imageView.image = model.image
            titleLabel.text = model.title
        }
    }
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height - 50))
        contentView.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: imageView.frame.maxY + 10, width: imageView.frame.width, height: 30))
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
