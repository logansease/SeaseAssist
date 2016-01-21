//
//  UIView+MotionEffectsGrouped.m
//  Conundrums
//
//  Created by lsease on 1/9/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIView+MotionEffectsGrouped.h"

@implementation UIView (MotionEffectsGrouped)
+(void)addMotionEffectsTo:(NSArray*)views withOffset:(float)offset
{
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        offset = offset * 2.5;
    }
    
    UIInterpolatingMotionEffect *horizontal = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontal.minimumRelativeValue = @(-1 * offset);
    horizontal.maximumRelativeValue = @(offset);
    
    UIInterpolatingMotionEffect *vertical = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    vertical.minimumRelativeValue = @(-1 * offset);
    vertical.maximumRelativeValue = @(offset);
    
    // this time we need to create a motion effects group and add both of our motion effects to it.
    UIMotionEffectGroup *motionEffects = [[UIMotionEffectGroup alloc] init];
    motionEffects.motionEffects = @[horizontal, vertical];
    
    // add the motion effects group to our view
    for(UIView * v in views)
    {
        [v addMotionEffect:motionEffects];
    }
}
@end
