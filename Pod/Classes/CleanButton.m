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

- (void)baseInit {
     [self makeClean];
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
