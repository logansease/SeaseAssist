//
//  String+QRCode.swift
//  BlockStackBrowser
//
//  Created by lsease on 6/30/17.
//  Copyright © 2017 blockstack. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

public extension String
{
    func toQRCode() -> UIImage? {
        
        let stringData = self.data(using: String.Encoding.utf8)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(stringData, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        if let ciImage = filter?.outputImage
        {
            return UIImage(ciImage: ciImage, scale: 1.0, orientation: .down)
        }else
        {
            return nil
        }
    }
    
    func toHiDefQRCode() -> UIImage? {
        
        let stringData = self.data(using: String.Encoding.utf8)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(stringData, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        if let ciImage = filter?.outputImage
        {
            let transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            let transformed = ciImage.transformed(by: transform)
            return UIImage(ciImage: transformed, scale: 1.0, orientation: .down)
            
        }else
        {
            return nil
        }
    }
    
}
