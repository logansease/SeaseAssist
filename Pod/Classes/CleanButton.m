//
//  CleanButton.m
//  Xoints
//
//  Created by lsease on 7/17/15.
//  Copyright (c) 2015 Logan Sease. All rights reserved.
//

#import "CleanButton.h"
#import "UIButton+Helpers.h"

@implementation CleanButton

-(void)setNeedsDisplay {
    [self makeClean];
}


@end
