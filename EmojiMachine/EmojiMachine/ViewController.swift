//
//  ViewController.swift
//  EmojiMachine
//
//  Created by Jeff on 17/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var picker: UIPickerView!
    var resultLabel: UILabel!
    var data = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]

        for _ in 0...2 {
            var array = [String]()
            for _ in 0...99 {
                array.append(imageArray[Int(arc4random_uniform(10))])
            }
            data.append(array)
        }
        
        picker = UIPickerView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 400))
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
        
        let button = UIButton(frame: CGRect(x: 30, y: picker.frame.maxY + 44, width: view.bounds.width - 60, height: 44))
        button.setTitle("GO", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        resultLabel = UILabel(frame: CGRect(x: 0, y: view.bounds.height - 100, width: view.bounds.width, height: 44))
        resultLabel.text = "💔"
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
    }
    
    func buttonTapped() {
        picker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        picker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        picker.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)

        if data[0][picker.selectedRow(inComponent: 0)] == data[1][picker.selectedRow(inComponent: 1)] &&
           data[1][picker.selectedRow(inComponent: 1)] == data[2][picker.selectedRow(inComponent: 2)] {
            resultLabel.text = "Bingo!"
        } else {
            resultLabel.text = "💔"
        }
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if view != nil {
            print(111)
            let label = view as! UILabel
            label.text = "123"
            
            return label
        } else {
            let label = UILabel()
            label.text = data[component][row]
            label.font = UIFont(name: "Apple Color Emoji", size: 80)
            label.textAlignment = NSTextAlignment.center
            return label
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component].count
    }
}













































