//
//  ViewController.swift
//  ImageScrollerEffect
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "steve")
        
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = image
        view.addSubview(backgroundImageView)
        
        let visualEffectView = UIVisualEffectView(frame: view.bounds)
        visualEffectView.effect = UIBlurEffect(style: .light)
        view.addSubview(visualEffectView)
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3
        view.addSubview(scrollView)
        
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: (view.bounds.height - image.size.height) / 2, width: view.bounds.width, height: image.size.height)
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
}




































