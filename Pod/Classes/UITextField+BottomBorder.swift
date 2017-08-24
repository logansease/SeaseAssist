//
//  UITextField+BottomBorder.swift
//  Bedkin
//
//  Created by lsease on 5/16/17.
//  Copyright © 2017 Bedkin. All rights reserved.
//

import UIKit

public extension UITextField {
    public func setBottomBorder(color: UIColor = UIColor(hex: "A5A5A5")) {
        self.borderStyle = .none
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.0
    }
}
