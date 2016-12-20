//
//  Keychain.swift
//  TurnOnVPN
//
//  Created by Jeff on 17/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation
import KeychainAccess

public struct KeychainWrapper {
    static var k: Keychain {
        return Keychain(service: "com.jeff.TurnVPNOn")
    }
    
    public static func setPassword(_ password: String, forVPNID VPNID: String) {
        let key = URL(string: VPNID)!.lastPathComponent
        try? k.remove(key)
        k[key] = password
    }
    
    public static func setSecret(_ secret: String, forVPNID VPNID: String) {
        let key = URL(string: VPNID)!.lastPathComponent
        try? k.remove("\(key)psk")
        k["\(key)psk"] = secret
    }
    
    public static func passwordForVPNID(_ VPNID: String) -> Data? {
        let key = URL(string: VPNID)!.lastPathComponent
        return k[attributes: key]?.persistentRef
    }
    
    public static func secretRefForVPNID(_ VPNID: String) -> Data? {
        let key = URL(string: VPNID)!.lastPathComponent
        if let data = k[attributes: "\(key)psk"]?.data,
           let value = String(data: data, encoding: .utf8),
            !value.isEmpty {
            return k[attributes: "\(key)psk"]?.persistentRef
        }
        return nil
    }
    
    public static func destoryKeyForVPNID(_ VPNID: String) {
        let key = URL(string: VPNID)!.lastPathComponent
        try? k.remove(key)
        try? k.remove("\(key)psk")
        try? k.remove("\(key)cert")
    }
    
    public static func passwordStringForVPNID(_ VPNID: String) -> String? {
        let key = URL(string: VPNID)!.lastPathComponent
        return k[key]
    }
    
    public static func secretStringForVPNID(_ VPNID: String) -> String? {
        let key = URL(string: VPNID)!.lastPathComponent
        return k["\(key)psk"]
    }
}






























