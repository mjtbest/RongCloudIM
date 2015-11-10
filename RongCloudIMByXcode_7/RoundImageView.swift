//
//  RoundImageView.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/8.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var cornerRadius: CGFloat = 0 {
        
       /*
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
       */
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = (cornerRadius > 0)

        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = (borderWidth > 0)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    

}
