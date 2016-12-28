//
//  ClosureSelector.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

public class ClosureSelector<Parameter> {
    
    public let selector: Selector
    private let closure: (Parameter) -> ()
    
    init(_ closure: @escaping (Parameter) -> ()) {
        selector = #selector(target)
        self.closure = closure
    }
    
    @objc func target(_ param: Any) {
        closure(param as! Parameter)
    }
}
