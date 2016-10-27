//
//  RoundedImageView.m
//  xoints
//
//  Created by Logan Sease on 7/16/15.
//  Copyright (c) 2015 Logan Sease. All rights reserved.
//

#import "RoundedView.h"
#import "UIView+Rounding.h"

@implementation RoundedView


- (void)baseInit {
    [self round];
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
