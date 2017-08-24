//
//  Array+Helpers.swift
//  Bedkin
//
//  Created by lsease on 1/4/17.
//  Copyright © 2017 Bedkin. All rights reserved.
//

import Foundation

public extension Array {
    public mutating func swap(from ind1: Int, to ind2: Int){
        var temp: Element
        temp = self[ind1]
        self[ind1] = self[ind2]
        self[ind2] = temp
    }
}
