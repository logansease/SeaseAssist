//
//  UIView+MotionEffect.m
//  CatchPhrase
//
//  Created by lsease on 1/16/14.
//
//

#import "UIView+MotionEffect.h"

@implementation UIView (MotionEffect)

-(void)addMotionEffectsWithOffset:(float)offset
{
    if([self respondsToSelector:@selector(addMotionEffect:)])
    {
        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
        {
            offset = offset * 2.5;\
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
        [self addMotionEffect:motionEffects];
    }
}

-(void)addVerticalMotionEffectsWithOffset:(float)offset
{
    if([self respondsToSelector:@selector(addMotionEffect:)])
    {
        UIInterpolatingMotionEffect *vertical = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        vertical.minimumRelativeValue = @(-1 * offset);
        vertical.maximumRelativeValue = @(offset);
        
        // this time we need to create a motion effects group and add both of our motion effects to it.
        UIMotionEffectGroup *motionEffects = [[UIMotionEffectGroup alloc] init];
        motionEffects.motionEffects = @[vertical];
        
        // add the motion effects group to our view
        [self addMotionEffect:motionEffects];
    }
}

-(void)resizeFullScreenViewAndAddMotionEffectsWithOffset:(float)offset
{
    if([self respondsToSelector:@selector(addMotionEffect:)])
    {
        self.frame = CGRectMake(0 - fabsf(offset), 0- fabsf(offset), self.frame.size.width + (fabsf(offset) * 2), self.frame.size.height + (fabsf(offset) * 2));
        [self addMotionEffectsWithOffset:offset];
    }
}

-(void)resizeHorizontallyAndAddMotionEffectsWithOffset:(float)offset
{
    if([self respondsToSelector:@selector(addMotionEffect:)])
    {
        self.frame = CGRectMake(self.frame.origin.x - fabsf(offset), self.frame.origin.y, self.frame.size.width + (fabsf(offset) * 2), self.frame.size.height );
        [self addMotionEffectsWithOffset:offset];
    }
}


@end
