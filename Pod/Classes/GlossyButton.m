//
//  GlossyButton.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "GlossyButton.h"
#import "UIButton+Helpers.h"

@implementation GlossyButton

- (void)baseInit {
    [self makeGlossy];
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
