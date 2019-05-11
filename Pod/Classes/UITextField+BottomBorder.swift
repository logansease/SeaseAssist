//
//  UITextField+BottomBorder.swift
//  SeaseAssist
//
//  Created by lsease on 5/16/17.
//  Copyright © 2017 Logan Sease. All rights reserved.
//

import UIKit

@objc public extension UITextField {
   @objc func setBottomBorder(color: UIColor = UIColor(hex: "A5A5A5")) {
        self.borderStyle = .none
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.0
    }
}
