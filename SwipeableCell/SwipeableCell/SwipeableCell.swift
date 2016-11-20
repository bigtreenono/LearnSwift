//
//  SwipeableCell.swift
//  SwipeableCell
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

struct Pattern {
    let imageName: String
    let title: String
}

class SwipeableCell: UITableViewCell {
    
    var pattern: Pattern! {
        didSet {
            patternImageView.image = UIImage(named: pattern.imageName)
            titleLabel.text = pattern.title
        }
    }
    var patternImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        patternImageView = UIImageView()
        contentView.addSubview(patternImageView)
        patternImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(contentView)
            make.width.equalTo(150)
        }
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(patternImageView.snp.right).offset(10)
            make.centerY.equalTo(patternImageView)
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
