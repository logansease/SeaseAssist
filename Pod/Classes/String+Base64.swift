//
//  String+Base64.swift
//  TokenStorage
//
//  Created by lsease on 11/30/17.
//  Copyright © 2017 Logan Sease. All rights reserved.
//

import Foundation

public extension String {
    
    func base64Encoded() -> String {
        let plainData = data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: [])
        return base64String!
    }
    
    func base64Decoded() -> String? {
        let decodedData = Data(base64Encoded: self, options: [])!
        return String(data: decodedData, encoding: .utf8)
    }
}
