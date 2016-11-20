//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Jeff on 19/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 26 / 255, green: 28 / 255, blue: 30 / 255, alpha: 1)
        
        let closeButton = UIButton()
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(20)
        }
        
        let tweetButton = UIButton()
        tweetButton.setTitle("Tweet", for: .normal)
        tweetButton.setTitleColor(.green, for: .normal)
        view.addSubview(tweetButton)
        tweetButton.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(closeButton)
        }
        
        let avatar = UIImageView(image: UIImage(named: "emojiself avatar"))
        view.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.left.equalTo(closeButton)
            make.top.equalTo(closeButton.snp.bottom).offset(20)
            make.width.height.equalTo(44)
        }
        
        let textView = UITextView()
        textView.backgroundColor = .white
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(avatar)
            make.left.equalTo(avatar.snp.right).offset(10)
            make.right.equalTo(tweetButton)
            make.height.equalTo(100)
        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(44)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main){ notification in
            if let userInfo = notification.userInfo {
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
                let bounds = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
                print(duration, bounds)
                UIView.animate(withDuration: duration, animations: {
                    bottomView.transform = CGAffineTransform(translationX: 0, y: -bounds.size.height)
                })
            }
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main){ notification in
            if let userInfo = notification.userInfo {
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
                UIView.animate(withDuration: duration, animations: {
                    bottomView.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
















































