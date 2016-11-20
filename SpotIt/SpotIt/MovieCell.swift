//
//  MovieCell.swift
//  SpotIt
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

class MovieCell: UITableViewCell {
    
    var movieImage: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var ratingLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
        
        movieImage = UIImageView()
        contentView.addSubview(movieImage)
        movieImage.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.left.equalTo(contentView).offset(5)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(movieImage.snp.right).offset(10)
            make.top.equalTo(movieImage)
        }
        
        subTitleLabel = UILabel()
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.width.equalTo(200)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        ratingLabel = UILabel()
        ratingLabel.layer.cornerRadius = 15
        ratingLabel.backgroundColor = .yellow
        contentView.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.right.equalTo(-40)
            make.centerY.equalTo(contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
