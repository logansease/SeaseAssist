//
//  UILabel+image.swift
//  Bedkin
//
//  Created by lsease on 3/3/17.
//  Copyright © 2017 Bedkin. All rights reserved.
//

import Foundation

@objc public extension UILabel
{
    @objc public func addToLeft(image: UIImage?)
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
    
    @objc public func addToRight(image: UIImage?)
    {
        if let image = image{
            let attachment = NSTextAttachment()
            attachment.image = image
            let attachString = NSAttributedString.init(attachment: attachment)
            let result = NSMutableAttributedString()
            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                self.text = nil
            }
            result.append(attachString)
            self.attributedText = result
        }
    }
}
