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

            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                
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
            
            let result = NSMutableAttributedString()
            if let text = text
            {
                let titleString = NSAttributedString(string: text)
                result.append(titleString)
                self.text = nil
            }
                        
            let attachString = NSAttributedString.init(attachment: attachment)
            result.append(attachString)
            self.attributedText = result
        }
    }
}
