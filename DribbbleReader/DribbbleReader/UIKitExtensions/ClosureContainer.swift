//
//  ClosureSelector.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

protocol Closurable: class {}
extension Closurable {

    func closureContainer(for closure: @escaping (Self) -> ()) -> ClosureContainer<Self> {
        let container = ClosureContainer(closure: closure)
        objc_setAssociatedObject(self, AssociatedKeys.DescriptiveName, container, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return container
    }
}

final class ClosureContainer<T> {
    
    let action: Selector
    private var closure: (T) -> ()

    init(closure: @escaping (T) -> ()) {
        self.closure = closure
        action = #selector(processHandler)
    }
    
    @objc func processHandler(_ param: Any) {
        closure(param as! T)
    }
}
















