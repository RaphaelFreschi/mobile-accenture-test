//
//  DesignableView.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit

@IBDesignable
class DesignableView: UIView{
    var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    var shadowOffsetY: CGFloat = 0 {
        didSet{
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}
