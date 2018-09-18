//
//  String+Random.swift
//  TokenStorage
//
//  Created by lsease on 11/15/17.
//  Copyright © 2017 casa. All rights reserved.
//

import Foundation

public extension String
{
    public static func generateRandom(length : Int = 32) -> String? {
        
        var keyData = Data(count: length)
        let length =  keyData.count
        let result = keyData.withUnsafeMutableBytes {
            SecRandomCopyBytes(kSecRandomDefault, length, $0)
        }
        if result == errSecSuccess {
            return keyData.base64EncodedString()
        } else {
            print("Problem generating random bytes")
            return nil
        }
    }
}
