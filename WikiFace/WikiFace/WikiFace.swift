//
//  WikiFace.swift
//  WikiFace
//
//  Created by Jeff on 20/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit

class WikiFace: NSObject {
    
    static func requestFaceInfo(with personName: String, size: CGSize, completion:@escaping (_ image: UIImage?, _ didFoundImage: Bool) -> ()) {
        let escapedString = personName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        print(escapedString, personName)
        
        let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&titles=\(escapedString!)&prop=pageimages&format=json&pithumbsize=\(Int(max(size.width, size.height)) * 2)")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                let wikiDict = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                
                if let query = wikiDict.object(forKey: "query") as? NSDictionary {
                    if let pages = query.object(forKey: "pages") as? NSDictionary {
                        if let pageContent = pages.allValues.first as? NSDictionary {
                            if let thumbnail = pageContent.object(forKey: "thumbnail") as? NSDictionary {
                                if let thumbURL = thumbnail.object(forKey: "source") as? String {
                                    let faceImage = UIImage(data: try! Data(contentsOf: URL(string: thumbURL)!))
                                    
                                    completion(faceImage, true)
                                }
                            } else {
                                completion(nil, false)
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    static func zoomInFace(_ imageView: UIImageView) {
        let context = CIContext(options: nil)
        let options = [CIDetectorAccuracy:CIDetectorAccuracyHigh]
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: options)
        
        let faceImage = imageView.image
        let ciImage = CIImage(cgImage: faceImage!.cgImage!)
        
        let features = detector?.features(in: ciImage)
        
        if (features?.count)! > 0 {
            
            var face:CIFaceFeature!
            
            for rect in features! {
                face = rect as! CIFaceFeature
            }
            
            var faceRectWithExtendedBounds = face.bounds
            faceRectWithExtendedBounds.origin.x -= 20
            faceRectWithExtendedBounds.origin.y -= 30
            
            faceRectWithExtendedBounds.size.width += 40
            faceRectWithExtendedBounds.size.height += 60
            
            let x = faceRectWithExtendedBounds.origin.x / faceImage!.size.width
            let y = (faceImage!.size.height - faceRectWithExtendedBounds.origin.y - faceRectWithExtendedBounds.size.height) / faceImage!.size.height
            
            let widthFace = faceRectWithExtendedBounds.size.width / faceImage!.size.width
            let heightFace = faceRectWithExtendedBounds.size.height  / faceImage!.size.height
            
            imageView.layer.contentsRect = CGRect(x: x, y: y, width: widthFace, height: heightFace)
        }
    }
}

























