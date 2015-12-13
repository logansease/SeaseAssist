//
//  UIImageView+Helpers.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "UIImageView+Helpers.h"

@implementation UIImageView (Helpers)
-(void)round
{
    /* FIRST, SQUARE THE IMAGE */
    
    UIImage *image = self.image;
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                cornerRadius:self.bounds.size.width / 2] addClip];
    // Draw your image
    [image drawInRect:self.bounds];
    
    // Get the image, here setting the UIImageView image
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    
    //NOW ROUND THE IMAGE
    self.bounds = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.height, self.frame.size.height);
}
@end
