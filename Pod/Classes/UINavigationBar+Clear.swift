//
//  UINavigationBar+Clear.swift
//  TokenStorage
//
//  Created by lsease on 1/25/18.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

public extension UINavigationBar
{
    public func makeClear()
    {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
    
    public func unmakeClear()
    {
        self.setBackgroundImage(nil, for: .default)
    }
}
