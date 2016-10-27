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

- (void)baseInit {
    [self circleWithColor:self.tintColor width:2];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}
@end
