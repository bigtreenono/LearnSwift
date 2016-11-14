//
//  ViewController.swift
//  StopWatch
//
//  Created by Jeff on 10/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var label: UILabel!
    var playButton: UIButton!
    var stopButton: UIButton!
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let resetButton = UIButton(frame: CGRect(x: view.bounds.width - 100, y: 60, width: 100, height: 30))
        resetButton.setTitle("Reset", for: .normal)
        resetButton.titleLabel?.font = .systemFont(ofSize: 13)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        view.addSubview(resetButton)
        
        label = UILabel(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 100))
        label.text = "0.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 100)
        label.textColor = .white
        view.addSubview(label)
        
        
        playButton = UIButton(frame: CGRect(x: 0, y: label.frame.maxY + 50, width: view.bounds.size.width / 2, height: view.bounds.height - label.frame.maxY - 50))
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.gray, for: .disabled)
        playButton.backgroundColor = .purple
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        view.addSubview(playButton)
        
        
        stopButton = UIButton(frame: CGRect(x: playButton.frame.maxX + 1, y: playButton.frame.minY, width: playButton.frame.width, height: playButton.frame.height))
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.gray, for: .disabled)
        stopButton.backgroundColor = .green
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        view.addSubview(stopButton)
        
    }
    
    func play(playButton: UIButton) {
        playButton.isEnabled = false
        stopButton.isEnabled = true

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ticktock), userInfo: nil, repeats: true)
    }
    
    func ticktock() {
        counter += 0.1
        label.text = String(format: "%.1f", counter)
    }
    
    func stop(stopButton: UIButton) {
        stopButton.isEnabled = false
        playButton.isEnabled = true
        
        timer.invalidate()
    }
    
    func reset(resetButton: UIButton) {
        stopButton.isEnabled = true
        playButton.isEnabled = true
        
        counter = 0.0
        label.text = "0.0"

        timer.invalidate()
    }
}






























