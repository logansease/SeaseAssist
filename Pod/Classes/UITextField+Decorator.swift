//
//  UITextField+Decorator.swift
//  Bedkin
//
//  Created by lsease on 12/21/16.
//  Copyright © 2016 Bedkin. All rights reserved.
//

import UIKit

public extension UITextField{

    public func decorateWithImage(named imageName:String) -> UIImageView
    {
        let image =  UIImage(named: imageName)!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        rightView = imageView
        self.rightViewMode = .always
        
        //add a little extra width to add an inset
        imageView.frame = CGRect(x: 0, y: 0, width: 34, height: 20)
        return imageView
    }
}
