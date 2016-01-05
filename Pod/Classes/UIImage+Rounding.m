//
//  UIImage+Rounding.m
//  conundrums
//
//  Created by Logan Sease on 12/30/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIImage+Rounding.h"

@implementation UIImage (Rounding)
-(UIImage*)clippedToCircle
{
    /* FIRST, SQUARE THE IMAGE */
    
    UIImage *image = self;
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height)
                                cornerRadius:self.size.width / 2] addClip];
    // Draw your image
    [image drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    // Get the image, here setting the UIImageView image
    UIImage * new = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return new;
}
@end
