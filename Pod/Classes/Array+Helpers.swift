//
//  Array+Helpers.swift
//  SeaseAssist
//
//  Created by lsease on 1/4/17.
//  Copyright © 2017 Logan Sease. All rights reserved.
//

import Foundation

public extension Array {
    mutating func swap(from ind1: Int, to ind2: Int){
        var temp: Element
        temp = self[ind1]
        self[ind1] = self[ind2]
        self[ind2] = temp
    }
    
}

public extension Dictionary {
    func keyArray() -> [AnyHashable]
    {
        let lazyMapCollection = self.keys
        return  Array(lazyMapCollection) as [AnyHashable]
    }
}
