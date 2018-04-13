//
//  UINavigationBar+Clear.swift
//  TokenStorage
//
//  Created by lsease on 1/25/18.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

extension UINavigationBar
{
    func makeClear()
    {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
    
    func unmakeClear()
    {
        self.setBackgroundImage(nil, for: .default)
    }
}
