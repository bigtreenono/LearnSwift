//
//  HTTPService.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

struct HTTPService {
    static func JSON(_ URLStirng: String, callback: @escaping (Array<Any>) -> Void) {
        let url = URL(string: URLStirng)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if data != nil {
                let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Array<Any>
                DispatchQueue.main.async {
                    callback(jsonData)
                }
            }
            session.invalidateAndCancel()
        }
        task.resume()
    }
    
    static func shots(_ URLString: String, callback: @escaping ([Shot]) -> Void) {
        JSON(URLString) { array in
            callback(array as! [Shot])
        }
    }
}
