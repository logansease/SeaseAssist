//
//  Validator.swift
//  Bedkin
//
//  Created by lsease on 11/9/16.
//  Copyright © 2016 Bedkin. All rights reserved.
//

import UIKit


//TODO: validate
@objc public class FormatHelper : NSObject {

    @objc public static func isValidEmail(email: String?) -> Bool
    {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    @objc public static func isDigitOfLength(_ test : String?, from rangeStart: Int, to rangeEnd : Int) -> Bool
    {
        guard let string = test else
        {
            return false
        }
        
        guard let _ = Int(string) else
        {
            return false
        }
        
        if string.count > rangeEnd || string.count < rangeStart
        {
            return false
        }
        
        return true
    }
}
