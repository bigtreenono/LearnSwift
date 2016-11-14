//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

struct Video {
    let imageName: String
    let title: String
    let subTitle: String
}

class VideoCell: UITableViewCell {
    var video: Video! {
        didSet {
            videoScreenshot.image = UIImage(named: video.imageName)
            videoTitleLabel.text = video.title
            videoSourceLabel.text = video.subTitle
        }
    }
    
    var videoScreenshot: UIImageView!
    var videoTitleLabel: UILabel!
    var videoSourceLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        videoScreenshot = UIImageView(frame: contentView.bounds)
        contentView.addSubview(videoScreenshot)
        
        let center = contentView.center
        
        videoTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 44))
        videoTitleLabel.center = CGPoint(x: center.x, y: center.y + 50)
        videoTitleLabel.textAlignment = .center
        videoTitleLabel.textColor = .white
        contentView.addSubview(videoTitleLabel)
        
        videoSourceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 44))
        videoSourceLabel.center = CGPoint(x: center.x, y: center.y + 100)
        videoSourceLabel.font = UIFont.systemFont(ofSize: 13)
        videoSourceLabel.textAlignment = .center
        videoSourceLabel.textColor = .white
        contentView.addSubview(videoSourceLabel)
    }
    
    override func layoutSubviews() {
        videoScreenshot.frame = contentView.bounds
        
        videoTitleLabel.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 44);
        videoTitleLabel.center = CGPoint(x: contentView.center.x, y: contentView.center.y + 10)
        
        videoSourceLabel.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 44);
        videoSourceLabel.center = CGPoint(x: contentView.center.x, y: contentView.center.y + 50)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}






























