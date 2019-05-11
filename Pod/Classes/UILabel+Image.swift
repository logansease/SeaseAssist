//
//  UILabel+image.swift
//  SeaseAssist
//
//  Created by lsease on 3/3/17.
//  Copyright © 2017 Logan Sease. All rights reserved.
//

import Foundation

@objc public extension UILabel
{
    @objc func addToLeft(image: UIImage?)
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
    
    @objc func addToRight(image: UIImage?)
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
