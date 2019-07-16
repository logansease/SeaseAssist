//
//  UIColor+rgb.swift
//
//  Created by lsease on 5/8/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

import UIKit

extension UIColor
{
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
