//
//  ViewController.swift
//  Where
//
//  Created by Jeff on 13/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        label = UILabel(frame: CGRect(x: 20, y: 50, width: view.bounds.width - 40, height: 88))
        label.textAlignment = .center
        label.text = "location"
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.bounds.height - 64, width: view.bounds.width - 40, height: 44))
        button.setTitle("Find my location", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func buttonTapped() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { [unowned self]
            (placemarks, error) in
            if error == nil, !placemarks!.isEmpty {
                self.locationManager.stopUpdatingLocation()
                
                let placemark = placemarks![0]
                
                self.label.text = (placemark.locality ?? "111") + (placemark.postalCode ?? "222") + "333"
            }
        }
    }
}
























