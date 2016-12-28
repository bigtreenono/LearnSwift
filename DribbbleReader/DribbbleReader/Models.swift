//
//  Models.swift
//  DribbbleReader
//
//  Created by Jeff on 25/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import Foundation

protocol DribbbleBase {
    var id: Int? {get set}
    init(data: Dictionary<String, Any>)
}

//struct DribbbleBase {
//    var id: Int
//    
//}

struct Shot: DribbbleBase {
    var id: Int?
    var imageURLString: String?
    var htmlURLString: String?
    var imageData: Data?
    
    var shotName = ""
    var designerName = ""
    var avatarURLString = ""
    var shotCount = 0
    
    
    
    init(data: Dictionary<String, Any>) {
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let images = data["images"] as? Dictionary<String, String>,
            let imageURLString = images["normal"] {
            self.imageURLString = imageURLString
        }
        
        if let htmlURLString = data["html_url"] as? String {
            self.htmlURLString = htmlURLString
        }
        
        shotName = data["title"] as! String
        let user = data["user"] as! Dictionary<String, String>
        designerName = user["name"]!
        avatarURLString = user["avatar_url"]!
        shotCount = data["views_count"] as! Int
    }
}







































