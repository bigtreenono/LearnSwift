//
//  DelegateSplitter.swift
//  DribbbleReader
//
//  Created by Jeff on 08/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class DelegateSplitter : NSObject {
    
    class func delegateSplitter(delegates: [UnsafeMutableRawPointer?]) -> DelegateSplitter {
        let splitter = DelegateSplitter()
        splitter.delegates = NSPointerArray.weakObjects()
        
        delegates.forEach {
            splitter.delegates.addPointer($0)
        }

        return splitter
    }
    
    func add(delegate: UnsafeMutableRawPointer?) {
        delegates.addPointer(delegate)
    }
    
    func remove(delegate: UnsafeMutableRawPointer?) {
        let index = indexOf(delegate: delegate)
        if index != NSNotFound {
            delegates.removePointer(at: index)
        }
        delegates.compact()
    }
    
    private var delegates: NSPointerArray!

    private func removeAllDelegates() {
        stride(from: delegates.count - 1, through: 0, by: -1).forEach { delegates.removePointer(at: $0) }
    }
    
    private func indexOf(delegate: UnsafeMutableRawPointer?) -> Int {
        for i in 0..<delegates.count {
            if delegates.pointer(at: i) == delegate {
                log?.debug("1111111111111111111111111111111111 \(i)")
                return i
            }
        }
        return NSNotFound
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        if super.responds(to: aSelector) {
            return true
        }
        
        for delegate in delegates.allObjects {
            //WARNING: 111
            if delegate is AnyObject {
                log?.debug("1111111111111111111111111111111111")
//                if ddd.responds(to: aSelector) {
//                    return true
//                }
            }
        }
        
        return false
    }

}


































