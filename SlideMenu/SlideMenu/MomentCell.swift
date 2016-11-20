//
//  MomentCell.swift
//  SlideMenu
//
//  Created by Jeff on 17/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

struct Moment {
    let backgroundImageName: String
    let avatarImageName: String
    let title: String
    let name: String
}

class MomentCell: UITableViewCell {
    
    var moment: Moment! {
        didSet {
            backgroundImageView.image = UIImage(named: moment.backgroundImageName)
            avatarImageView.image = UIImage(named: moment.avatarImageName)
        }
    }
    
    var backgroundImageView: UIImageView!
    var avatarImageView: UIImageView!
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundImageView = UIImageView(frame: contentView.bounds)
        contentView.addSubview(backgroundImageView)
        
        avatarImageView = UIImageView(frame: CGRect(x: 20, y: contentView.bounds.height - 60 - 20, width: 60, height: 60))
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.clipsToBounds = true
        contentView.addSubview(avatarImageView)
        
//        titleLabel = UILabel(frame: CGRect)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImageView.frame = contentView.bounds
        avatarImageView.frame = CGRect(x: 20, y: contentView.bounds.height - 60 - 20, width: 60, height: 60)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("123")
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
