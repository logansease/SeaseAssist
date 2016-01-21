//
//  UIView+Blur.m
//  Conundrums
//
//  Created by lsease on 1/10/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIView+Blur.h"

@implementation UIView (Blur)
-(UIVisualEffectView*)blur
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    beView.frame = self.bounds;
    beView.tag = kVisualEffectViewTag;
    [self addSubview:beView];
    [self sendSubviewToBack:beView];
    return beView;
}
@end
