//
//  UILabel+image.swift
//  Bedkin
//
//  Created by lsease on 3/3/17.
//  Copyright © 2017 Bedkin. All rights reserved.
//

import Foundation

public extension UILabel
{
    public func addToLeft(image: UIImage?)
    {
        if let image = image{
            let attachment = NSTextAttachment()
            attachment.image = image
            let attachString = NSAttributedString.init(attachment: attachment)
            let result = NSMutableAttributedString()
            result.append(attachString)
            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                self.text = nil
            }
            self.attributedText = result
        }
    }
}
