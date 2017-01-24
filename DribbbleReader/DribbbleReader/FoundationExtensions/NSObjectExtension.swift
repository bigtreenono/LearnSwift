//
//  NSObjectExtension.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }

    func associateObject(_ key: UnsafeRawPointer!, _ value: Any!) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func associatedObject(_ key: UnsafeRawPointer!) -> Any! {
        return objc_getAssociatedObject(self, key)
    }
    
//    func associatedObject(_ key: UnsafeRawPointer!, initialiser: () -> Any) -> Any! {
//        if let associated = objc_getAssociatedObject(self, key) { return associated }
//        let associated = initialiser()
//        objc_setAssociatedObject(self, key, associated, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        return associated
//    }
    
    
    // http://stackoverflow.com/questions/39562887/how-to-implement-method-swizzling-swift-3-0
    class func swizzleMethods(originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}



















