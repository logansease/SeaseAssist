//
//  CircleButton.m
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//
#import "CircleButton.h"
#import "UIView+Rounding.h"

@implementation CircleButton
-(void)setNeedsDisplay {
    [self circleWithColor:self.tintColor width:2];
}
@end
