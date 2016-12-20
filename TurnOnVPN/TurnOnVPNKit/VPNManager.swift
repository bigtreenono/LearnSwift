//
//  VPNManager.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation
import NetworkExtension
import MMDB

let kAppGroupIdentifier = "group.TurnOnVPN"

public enum VPNType {
    case IPSec
    case IKEv2
}

public struct VPNAccount {
    public var ID = ""
    public var type: VPNType = .IPSec
    public var title = ""
    public var server = ""
    public var account: String?
    public var group: String?
    public var remoteID: String?
    public var alwaysOn = true
    public var passwordRef: Data? {
        return KeychainWrapper.passwordForVPNID(ID)
    }
    public var secretRef: Data? {
        return KeychainWrapper.secretRefForVPNID(ID)
    }
    public init() {}
}

typealias VPNConfigureCompletion = (Void) -> Void

public class VPNManager {
    public static let sharedManager = VPNManager()
    
    var manager: NEVPNManager {
        return NEVPNManager.shared()
    }
    
    lazy var defaults: UserDefaults = {
        return UserDefaults(suiteName: kAppGroupIdentifier)!
    }()
    
    var status: NEVPNStatus {
        return manager.connection.status
    }
    
    lazy var mmdb: MMDB? = {
        return MMDB()
    }()

    func loadPreferences(_ completion: @escaping () -> Void) {
        manager.loadFromPreferences { error in
            assert(error == nil, "Failed to load preferences: \(error?.localizedDescription)")
            completion()
        }
    }
    
    func save(_ account: VPNAccount, completion: VPNConfigureCompletion?) {
        loadPreferences { [weak self] in
            self?._save(account, completion: completion)
        }
    }
    
    func _save(_ account: VPNAccount, completion: VPNConfigureCompletion?) {
        #if (arch(i386) || arch(x86_64) && os(iOS))
            assert(false, "I'm afraid you can not connect VPN in simulators")
        #endif
        
//        var pt: NEVPNProtocol
//        
//        if account.type == .IPSec {
//            let p = NEVPNProtocolIPSec()
//            p.useExtendedAuthentication = true
//            p.localIdentifier = account.group ?? "VPN"
//            
//            pt = p
//        } else {
//            let p = NEVPNProtocolIKEv2()
//            
//            pt = p
//        }
//        
//        pt.disconnectOnSleep = !account.alwaysOn
        
    }
}
































