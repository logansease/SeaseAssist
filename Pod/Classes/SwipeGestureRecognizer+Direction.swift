//
//  SwipeGestureRecognizer+Direction.swift
//  PhrasePartySwift
//
//  Created by lsease on 7/16/19.
//  Copyright © 2019 iParty Mobile. All rights reserved.
//

import UIKit

extension UISwipeGestureRecognizer
{
    convenience public init(target: Any?, action: Selector?, direction: Direction) {
        self.init(target: target, action: action)
        self.direction = direction
    }
}
