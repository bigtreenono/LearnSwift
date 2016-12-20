//
//  VPNManager+Domains.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

let kOnDemandKey = "onDemand"
let kOnDemandDomainsKey = "onDemandDomains"

extension VPNManager {
    public var onDemand: Bool {
        get {
            return defaults.bool(forKey: kOnDemandKey)
        }
        set {
            defaults.set(newValue, forKey: kOnDemandKey)
            defaults.synchronize()
        }
    }
    
    var onDemandDomains: String? {
        get {
            return defaults.string(forKey: kOnDemandDomainsKey)
        }
        set {
            if newValue == nil {
                defaults.removeObject(forKey: kOnDemandDomainsKey)
            } else {
                defaults.set(newValue, forKey: kOnDemandDomainsKey)
            }
            defaults.synchronize()
        }
    }
    
}






























