//
//  File.swift
//  TokenStorage
//
//  Created by lsease on 1/25/18.
//  Copyright © 2018 Logan Sease. All rights reserved.
//

import UIKit

@objc public extension UITableView
{
    @objc func deselect(animated : Bool = true)
    {
        if let index = self.indexPathForSelectedRow
        {
            self.deselectRow(at: index, animated: animated)
        }
    }
}
