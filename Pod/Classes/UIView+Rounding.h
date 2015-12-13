//
//  UIView+Rounding.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Rounding)
-(void)round:(float)cornerRadius withBorderWidth:(float)width andColor:(UIColor*)color;
-(void)round;
-(void)circleWithColor:(UIColor*)color width:(float)width;
-(void)circle;
@end
