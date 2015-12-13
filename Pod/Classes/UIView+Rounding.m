//
//  UIView+Rounding.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "UIView+Rounding.h"

@implementation UIView (Rounding)

-(void)round:(float)cornerRadius withBorderWidth:(float)width andColor:(UIColor*)color
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = NO;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}
-(void)round
{
    [self round:9 withBorderWidth:1 andColor:[UIColor lightGrayColor]];
}

-(void)circle
{
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.masksToBounds = YES;
}

-(void)circleWithColor:(UIColor*)color width:(float)width
{
    [self circle];
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth  = width;
}


@end
