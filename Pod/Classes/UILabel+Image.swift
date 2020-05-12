//
//  UILabel+image.swift
//  SeaseAssist
//
//  Created by lsease on 3/3/17.
//  Copyright © 2017 Logan Sease. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UILabel
{
    @objc func addImageToLeft(_ image: UIImage?)
    {
        self.baselineAdjustment = .alignCenters
        if let image = image {
            
            let attachment = NSTextAttachment()
            attachment.image = image
            let attachString = NSAttributedString.init(attachment: attachment)
            let result = NSMutableAttributedString()
            result.append(attachString)
            
            let heightDiff = self.font.lineHeight - image.size.height
            result.addAttribute(.baselineOffset, value: heightDiff / 2, range: NSRange(location: 0, length: 1))
            
            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                result.addAttribute(.baselineOffset, value: -heightDiff/2, range: NSRange(location: 1, length: result.length - 1))
                
                self.text = nil
            }
            self.attributedText = result
        }
    }
    
    @objc func addImageToRight(_ image: UIImage?)
    {
        self.baselineAdjustment = .alignCenters
        if let image = image{
            let attachment = NSTextAttachment()
            attachment.image = image
            
            let heightDiff = self.font.lineHeight - image.size.height
            
            let result = NSMutableAttributedString()
            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                result.addAttribute(.baselineOffset, value: -heightDiff / 2, range: NSRange(location: 0, length: result.length))
                self.text = nil
            }
                        
            let attachString = NSAttributedString.init(attachment: attachment)
            result.append(attachString)
            result.addAttribute(.baselineOffset, value: heightDiff / 2, range: NSRange(location: result.length - 1, length: 1))
            self.attributedText = result
        }
    }
}
