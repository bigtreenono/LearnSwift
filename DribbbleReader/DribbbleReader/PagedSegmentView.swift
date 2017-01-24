//
//  TestView.swift
//  DribbbleReader
//
//  Created by Jeff on 31/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

let kHeightOfPagedSegmentView: CGFloat = 38
private let kExtraWidthOfPagedButton: CGFloat = 20

class PagedSegmentView: UIView {
    
    var SelectedCallback: ((Int) -> ())?
    
    var normalFontSize: CGFloat = 13, selectedFontSize: CGFloat = 15
    
    var scrollEnable = false {
        didSet {
            scrollView.isScrollEnabled = scrollEnable
        }
    }
    
    var isHiddenBottomScrollableView = true {
        didSet {
            bottomScrollableView.isHidden = isHiddenBottomScrollableView
        }
    }
    
    var controllers: [UIViewController]? {
        willSet {
            contentView.subviews.forEach { $0.removeFromSuperview() }
        }
        didSet {
            guard let controllers = controllers, !controllers.isEmpty else { return }
            
            let titles = controllers.flatMap { $0.title }
            if titles.isEmpty {
                return
            }
            
            var buttons = [GradientButton]()
            var previousButton: GradientButton?
            
            for (index, title) in titles.enumerated() {
                
                let gradientButton = GradientButton()
                gradientButton.tag = index
                gradientButton.normalColor = (96, 125, 139)
                gradientButton.selectedColor = (55, 71, 79)
                gradientButton.normalFontSize = normalFontSize
                gradientButton.selectedFontSize = selectedFontSize
                gradientButton.isSelected = index == 0
                gradientButton.setTitle(title, for: .normal)
                gradientButton.addTarget{ [unowned self] button in
                    let tag = button.tag
                    if tag != self.previousIndex {
                        if self.SelectedCallback != nil {
                            self.SelectedCallback!(tag)
                        }
                        self.handleEndDecelerating(destinationIndex: tag, animated: true)
                    }
                }
                contentView.addSubview(gradientButton)
                buttons.append(gradientButton)
                
                gradientButton.snp.makeConstraints({ (make) in
                    if let previousButton = previousButton {
                        make.left.equalTo(previousButton.snp.right)
                    } else {
                        make.left.equalToSuperview()
                    }
                    
                    if scrollEnable {
                        let titleWdith = title.width(withFontSize: normalFontSize)
                        make.width.equalTo(titleWdith + kExtraWidthOfPagedButton)
                    } else {
                        make.width.equalToSuperview().dividedBy(titles.count)
                    }
                    
                    make.top.equalToSuperview()
                    make.height.equalToSuperview()
                })
                
                if gradientButton.isSelected {
                    bottomScrollableView.snp.makeConstraints({ (make) in
                        make.width.equalTo(gradientButton)
                        make.left.equalTo(gradientButton)
                    })
                }
                
                previousButton = gradientButton
            }
            gradientButtons = buttons
            
            contentView.snp.makeConstraints { (make) in
                if scrollEnable {
                    make.right.equalTo(previousButton!)
                } else {
                    make.width.equalToSuperview()
                }
            }
        }
    }

    func handleEndDecelerating(destinationIndex: Int, animated: Bool) {
        guard destinationIndex != previousIndex else { return }
        defer {
            previousIndex = destinationIndex
        }
        
        let currentButton = gradientButtons[destinationIndex]
        currentButton.isSelected = true
        
        let previousButton = gradientButtons[previousIndex]
        previousButton.isSelected = false

        if scrollEnable {
            let offsetX = max(0, currentButton.centerX - scrollView.width * 0.5)
            let maxOffsetX = max(0, scrollView.contentSize.width - scrollView.width)
            scrollView.setContentOffset(CGPoint(x: min(offsetX, maxOffsetX), y: 0), animated: animated)
        }

        bottomScrollableView.snp.remakeConstraints { (make) in
            make.width.equalTo(currentButton)
            make.left.equalTo(currentButton)
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
        UIView.animate {
            self.bottomScrollableView.superview?.layoutIfNeeded()
        }
    }
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var bottomScrollableView: UIView!
    private var previousIndex = 0
    private var gradientButtons: [GradientButton]!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let separator = UIView()
        separator.backgroundColor = JCColor.bottomMenuHairlineColor
        addSubview(separator)
        separator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        addSubview(scrollView)
        scrollView.snp.makeConstraints({ (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(separator.snp.top)
        })
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        bottomScrollableView = UIView()
        bottomScrollableView.backgroundColor = separator.backgroundColor
        scrollView.addSubview(bottomScrollableView)
        bottomScrollableView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }
}

extension PagedSegmentView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        if offsetX <= 0 {
            return
        }
        
        let delta = offsetX / scrollView.width
        let leftIndex = Int(delta)
        
        log?.debug("delta \(delta), leftIndex \(leftIndex)")
//        if delta == leftIndex {
//            return
//        }
        
//        let scaleRight = delta - leftIndex
    }
}





















































