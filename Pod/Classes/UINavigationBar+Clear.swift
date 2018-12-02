//
//  UINavigationBar+Clear.swift
//  TokenStorage
//
//  Created by lsease on 1/25/18.
//  Copyright © 2018 Logan Sease. All rights reserved.
//

import UIKit

@objc public extension UINavigationBar
{
    @objc public func makeClear()
    {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
    
    @objc public func unmakeClear()
    {
        self.setBackgroundImage(nil, for: .default)
    }
}
