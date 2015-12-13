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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)setNeedsDisplay {
    [self round];
}

@end
