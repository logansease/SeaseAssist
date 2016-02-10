//
//  UIView+Animation.h
//  CatchPhrase
//
//  Created by Logan Sease on 9/11/15.
//
// ios 7+

#import <UIKit/UIKit.h>

@interface UIView (Animation)
-(void)bounceFrom:(float)from to:(float)to;
-(void)bounceTo:(float)scale;
-(void)bounce:(BOOL)repeat;
-(void)endAnimation;
@end
