//
//  File.swift
//  TokenStorage
//
//  Created by lsease on 1/25/18.
//  Copyright © 2018 casa. All rights reserved.
//

import UIKit

public extension UITableView
{
    public func deselect(animated : Bool = true)
    {
        if let index = self.indexPathForSelectedRow
        {
            self.deselectRow(at: index, animated: animated)
        }
    }
}
