//
//  String+Utils.swift
//  Bedkin
//
//  Created by lsease on 12/27/16.
//  Copyright © 2016 Bedkin. All rights reserved.
//

import UIKit

public extension String {
    
    public static func isEmpty(_ string : String?) -> Bool
    {
        let count = nonWhiteSpaceCharacterCount(string)
        return count <= 0
    }
    
    public static func nonWhiteSpaceCharacterCount(_ string : String? ) -> Int
    {
        guard let test = string else
        {
            return 0
        }
        
        let trimmed = test.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "")
        return trimmed.characters.count
    }
    
    
    //this is a special version of title case that will handle things like O' and Mc in last Names
    //by just capitalizing the first letters of each word, but not modifying case of other characters
    public func upperCasedWords() -> String{
        var result = ""
        
        let components = self.components(separatedBy: " ")
        for (component) in components
        {
            result.append(component.capitalizingFirstLetter())
            if component != components.last
            {
                result.append(" ")
            }
        }
        return result
    }
    
    public func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
}
