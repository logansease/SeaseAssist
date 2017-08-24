//
//  Date+Utils.swift
//  Bedkin
//
//  Created by lsease on 2/23/17.
//  Copyright © 2017 Bedkin. All rights reserved.
//


public extension Date {
    
    public func isSameDay(as date: Date?) -> Bool{
        guard let date = date else
        {
            return false
        }
        
        let myDay = (self as NSDate).dateWithoutTime()
        let otherDay = (date as NSDate).dateWithoutTime()
        
        return myDay == otherDay
    }
    
    public func nsdate() -> NSDate {
        return self as NSDate
    }
    
    public func isOnOrAfter(_ date: Date!) -> Bool
    {
        return self.isSameDay(as: date) || self.nsdate().is(after: date)
    }
    
}
