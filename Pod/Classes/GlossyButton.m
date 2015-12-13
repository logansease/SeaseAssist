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

-(void)setNeedsDisplay {
    [self makeGlossy];
}

@end
