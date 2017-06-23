//
//  UIViewExtension.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     * Function's name: addCircle
     * Params: None
     * This function is to create circle view component
     **/
    func addCircle() {
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
    }
    
    /**
     * Function's name: addCornerRadius
     * Params: radius (CGFloat)
     * This function is to create corner radius for view component
     **/
    func addCornerRadius(radius: CGFloat = 5.0) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    /**
     * Function's name: addShadow
     * Params: radius (CGFloat)
     * This function is to create corner radius for view component
     **/
    func addShadow(with offset: CGSize = CGSize.zero, with radius: CGFloat = 5.0, andOpacity opacity: Float = 0.8) {
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
}
