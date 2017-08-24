//
//  String+CaseConversion.swift
//  Bedkin
//
//  Created by lsease on 10/27/16.
//  Copyright © 2016 Bedkin. All rights reserved.
//

import Foundation

public extension String{
    
    public func camelCaseToTitleCase() -> String!
    {
        var string = self
        
        string = string.replacingOccurrences(of: "([a-z])([A-Z,0-9])", with: "$1 $2", options: .regularExpression, range: nil)

        string = string.capitalized
        
        return string
    }
    
    public func camelCaseToUnderscoreCase() -> String!
    {
        var string = self
        
        string = string.replacingOccurrences(of: "([a-z])([A-Z,0-9])", with: "$1_$2", options: .regularExpression, range: nil)
        
        string = string.lowercased()
        
        return string
    }
    
    public func underscoreCaseToCamelCase() -> String!
    {
        var result = ""
        
        let pieces = self.components(separatedBy: "_")
        for piece in pieces
        {
            if piece != pieces.first
            {
                result = result + piece.capitalized
            } else{
                result = result + piece
            }
        }
        
        return result
    }
}
