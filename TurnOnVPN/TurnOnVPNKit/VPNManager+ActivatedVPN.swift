//
//  VPNManager+ActivatedVPN.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

let kActivatedVPNIDKey = "activatedVPNID"

extension VPNManager {
    public var activatedVPNID: String? {
        get {
            return defaults.string(forKey: kActivatedVPNIDKey)
        }
        set {
            if newValue == nil {
                defaults.removeObject(forKey: kActivatedVPNIDKey)
            } else {
                defaults.set(newValue, forKey: kActivatedVPNIDKey)
            }
            defaults.synchronize()
        }
    }
    
}
