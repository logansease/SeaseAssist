//
//  UIView+Animation.m
//  CatchPhrase
//
//  Created by Logan Sease on 9/11/15.
//
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

-(void)bounceFrom:(float)from to:(float)to
{

        self.transform = CGAffineTransformMakeScale(from, from);
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.2 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.transform = CGAffineTransformMakeScale(to, to);
        } completion:^(BOOL finished) {
            
        }];
    
}

-(void)bounceTo:(float)scale
{
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.2 initialSpringVelocity:0 options:0 animations:^{
        self.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.2 initialSpringVelocity:0 options:0 animations:^{
            self.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
            
        }];
    }];
}

-(void)bounce:(BOOL)repeat
{
    [UIView animateWithDuration:.1 delay:.35 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.transform = CGAffineTransformMakeScale(.93, .93);
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:.8 delay:0 usingSpringWithDamping:.2 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
                if(finished && repeat)
                {
                    [self bounce:YES];
                }
            }];
        }
    }];
}

-(void)endAnimation
{
    [CATransaction begin];
    [self.layer removeAllAnimations];
    [CATransaction commit];
}

@end
