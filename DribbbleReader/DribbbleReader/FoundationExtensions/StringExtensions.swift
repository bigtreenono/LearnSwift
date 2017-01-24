//
//  StringExtensions.swift
//  DribbbleReader
//
//  Created by Jeff on 05/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

extension String {
    
    func height(withFontSize: CGFloat) -> CGFloat {
        return height(withWidth: CGFloat.greatestFiniteMagnitude, fontSize: withFontSize)
    }
    
    func height(withWidth: CGFloat, fontSize: CGFloat) -> CGFloat {
        return rect(withWidth: withWidth, height: CGFloat.greatestFiniteMagnitude, fontSize: fontSize).width
    }
    
    func width(withFontSize: CGFloat) -> CGFloat {
        return width(withHeight: CGFloat.greatestFiniteMagnitude, fontSize: withFontSize)
    }
    
    func width(withHeight: CGFloat, fontSize: CGFloat) -> CGFloat {
        return rect(withWidth: CGFloat.greatestFiniteMagnitude, height: withHeight, fontSize: fontSize).width
    }
    
    func rect(withWidth: CGFloat, height: CGFloat, fontSize: CGFloat) -> CGRect {
        return self.boundingRect(with: CGSize(width: withWidth, height: height), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: fontSize)], context: nil)
    }
}
